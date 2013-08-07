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

# PRIVATE METHODS
private

end
