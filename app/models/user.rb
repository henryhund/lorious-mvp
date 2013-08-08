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
		stripe_response = Stripe::Customer.create(email: self.email, card: card_token)
    save_stripe_customer(stripe_response)

    if stripe_response.active_card.present?
	    save_last_4_digits(stripe_response)
	    save_card_type(stripe_response)
	  end
	end

  def update_credit_card(token)
    stripe_customer = Stripe::Customer.retrieve(self.stripe_customer_id)
    stripe_customer.card = token
    stripe_response = stripe_customer.save
    last_4_digits = stripe_response.active_card.last4
    card_type = stripe_response.active_card.type.downcase
    self.update_attributes(last_4_digits: last_4_digits, card_type: card_type)
  end

  def has_credit_card?
     return true if self.stripe_customer_id.present? && self.last_4_digits.present? && self.card_type.present?
  end

# PRIVATE METHODS
private

  def save_stripe_customer(stripe_response)
    update_attribute("stripe_customer_id", stripe_response.id)
	end

  def save_last_4_digits(stripe_response)
    update_attribute("last_4_digits", stripe_response.active_card.last4)
  end

  def save_card_type(stripe_response)
    update_attribute("card_type", stripe_response.active_card.type.downcase)
  end

end
