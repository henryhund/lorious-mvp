class User < ActiveRecord::Base
# ASSOCIATIONS
	has_many :authentications, dependent: :destroy
	has_one :profile, dependent: :destroy
  has_many :credit_purchases
  has_many :credit_payouts
  has_many :appointments, foreign_key: "requester_id"
  has_many :messages_sent, class_name: "Message", foreign_key: "from_user_id"
  has_many :messages_received, class_name: "Message", foreign_key: "to_user_id"

# VALIDATIONS

# SPECIAL FEATURES

# SCOPES

# DELEGATIONS

# CALLBACKS

# CONFIG METHODS
	def to_s
    self.name
	end

  def name
    "#{self.firstname} #{self.lastname}"
  end

  def to_param
    self.username
  end

  def expert?
    false
  end

# CLASS METHODS

# INSTANCE METHODS
  def messages
    (self.messages_sent + self.messages_received).sort! { |a,b| a.created_at <=> b.created_at }.reverse!
  end

	def create_stripe_customer(card_token)
		customer = create_stripe_customer_api_call(card_token)
    self.update_attributes(
      stripe_customer_id: customer.id,
      card_last_4_digits: customer.cards.first.last4,
      card_type: customer.cards.first.type.downcase
    )
 	end

  def create_stripe_bank_account(account_token)
    recipient = create_stripe_bank_account_api_call(account_token)
    self.update_attributes(
      stripe_recipient_id: recipient.id,
      bank_name: recipient.active_account.bank_name.downcase,
      bank_last_4_digits: recipient.active_account.last4
      )
  end

  def purchase_credits(number_of_credits)
    validate_credit_purchase(number_of_credits)
    dollar_amount = number_of_credits * 100
    charge = purchase_credits_from_stripe_api_call(dollar_amount)

    self.credit_purchases.create!({
      stripe_id:            charge["id"],
      stripe_fee:           charge["fee"].to_i,
      number_of_credits:    number_of_credits,
      dollar_amount:        charge["amount"].to_i
    })

    new_credit_balance = self.credit_balance + number_of_credits
    self.update_attributes(credit_balance: new_credit_balance)
  end

  def payout_credits(number_of_credits)
    validate_credit_payout(number_of_credits)
    dollar_amount = number_of_credits * 100
    payout = payout_credits_from_stripe_api_call(dollar_amount)

    self.credit_payouts.create!({
      stripe_id:            payout["id"],
      stripe_fee:           payout["fee"].to_i,
      number_of_credits:    number_of_credits,
      dollar_amount:        payout["amount"].to_i
    })

    new_credit_balance = self.credit_balance - number_of_credits
    self.update_attributes(credit_balance: new_credit_balance)
  end

  def has_credit_card?
     return true if self.stripe_customer_id.present? && self.card_last_4_digits.present? && self.card_type.present?
  end

  def has_bank_account?
    return true if self.stripe_recipient_id.present? && self.bank_last_4_digits.present? && self.bank_name.present?
  end

# PRIVATE METHODS
private
  def create_stripe_customer_api_call(card_token)
    Stripe::Customer.create(card: card_token, description: self.email)
  end

  def create_stripe_bank_account_api_call(account_token)
    Stripe::Recipient.create(name: self.name, type: "individual", email: self.email, bank_account: account_token)
  end

  def purchase_credits_from_stripe_api_call(dollar_amount)
    begin
      charge = Stripe::Charge.create(
        amount:     dollar_amount,
        currency:   "usd",
        customer:   self.stripe_customer_id
      )
      return charge
    rescue Stripe::CardError => e
      # HANDLING
    end
  end

  def payout_credits_from_stripe_api_call(dollar_amount)
    begin
      transfer = Stripe::Transfer.create(
        amount: dollar_amount,
        currency: "usd",
        recipient: self.stripe_recipient_id,
        statement_descriptor: "Lorious - Credit Payout"
        )
    rescue Exception => e
      # HANDLING
    end
  end

  def validate_credit_purchase(number_of_credits)
    raise CreditPurchaseError.new(:purchase_credits, "number of credits is negative") if number_of_credits < 0
    raise CreditPurchaseError.new(:purchase_credits, "number of credits is zero") if number_of_credits == 0
  end

  def validate_credit_payout(number_of_credits)
    raise CreditPayoutError.new(:payout_credits, "number of credits is negative") if number_of_credits < 0
    raise CreditPayoutError.new(:payout_credits, "number of credits is zero") if number_of_credits == 0
    raise CreditPayoutError.new(:payout_credits, "does not have enough credits") if number_of_credits > self.credit_balance
  end

end
