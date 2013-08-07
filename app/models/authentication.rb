class Authentication < ActiveRecord::Base
# ASSOCIATIONS
	belongs_to :user

# VALIDATIONS
	validates :provider, presence: true, uniqueness: { scope: :user_id }
	validates :uid, presence: true, uniqueness: { scope: :provider }

# SPECIAL FEATURES

# SCOPES

# DELEGATIONS

# CALLBACKS

# CONFIG METHODS
	def to_s
	end

	# def to_param
	# end

# CLASS METHODS

# INSTANCE METHODS

# PRIVATE METHODS
private

end
