class CreditPurchase < ActiveRecord::Base
# ASSOCIATIONS
	belongs_to :user

# VALIDATIONS

# SPECIAL FEATURES

# SCOPES

# DELEGATIONS

# CALLBACKS

# CONFIG METHODS
	def to_s
		"PURCHASE - #{self.created_at.strftime('%b %d %Y')} - #{self.number_of_credits} credits - $#{self.dollar_amount / 100.0}"
	end

# CLASS METHODS

# INSTANCE METHODS

# PRIVATE METHODS
private

end
