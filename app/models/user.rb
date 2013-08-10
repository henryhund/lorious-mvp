class User < ActiveRecord::Base
# ASSOCIATIONS
	has_many :authentications, dependent: :destroy
	has_one :profile, dependent: :destroy
  has_many :credit_purchases
  has_many :credit_payouts

# VALIDATIONS

# SPECIAL FEATURES

# SCOPES

# DELEGATIONS

# CALLBACKS

# CONFIG METHODS
	def to_s
    self.name
	end

	def to_param
    self.username
	end

# CLASS METHODS

# INSTANCE METHODS
	def create_stripe_customer(card_token)
		customer = create_stripe_customer_api_call(card_token)
    self.update_attributes(
      stripe_customer_id: customer.id,
      last_4_digits: customer.cards.first.last4,
      card_type: customer.cards.first.type.downcase
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

  # def update_credit_card(token)
  #   stripe_customer = Stripe::Customer.retrieve(self.stripe_customer_id)
  #   stripe_customer.card = token
  #   stripe_response = stripe_customer.save
  #   last_4_digits = stripe_response.active_card.last4
  #   card_type = stripe_response.active_card.type.downcase
  #   self.update_attributes(last_4_digits: last_4_digits, card_type: card_type)
  # end

  def has_credit_card?
     return true if self.stripe_customer_id.present? && self.last_4_digits.present? && self.card_type.present?
  end

# PRIVATE METHODS
private
  def create_stripe_customer_api_call(card_token)
    Stripe::Customer.create(card: card_token, description: self.email)
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

  def validate_credit_purchase(number_of_credits)
    raise CreditPurchaseError.new(:purchase_credits, "number of credits is negative") if number_of_credits < 0
    raise CreditPurchaseError.new(:purchase_credits, "number of credits is zero") if number_of_credits == 0
  end

end
