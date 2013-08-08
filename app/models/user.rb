class User < ActiveRecord::Base
# ASSOCIATIONS
	has_many :authentications
	has_one :profile

# VALIDATIONS

# SPECIAL FEATURES

# SCOPES
	default_scope -> { where(active: true) }

# DELEGATIONS

# CALLBACKS

# CONFIG METHODS
	def to_s
	end

	def destroy
		self.update_attributes(active: false)
	end

	# def to_param
	# end

# CLASS METHODS

# INSTANCE METHODS
	def create_stripe_customer(card_token)
		stripe_response = Stripe::Customer.create(email: self.email, card: card_token)
    save_stripe_customer(stripe_response)
    save_last_4_digits(stripe_response)
    save_card_type(stripe_response)
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
     return true if self.stripe_customer_id.present?
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