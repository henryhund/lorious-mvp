class Tag < ActiveRecord::Base
# ASSOCIATIONS
  has_many :taggings
  has_many :experts, through: :taggings

# VALIDATIONS

# SPECIAL FEATURES

# SCOPES

# DELEGATIONS

# CALLBACKS

# CONFIG METHODS
  def to_s
    self.name
  end

# CLASS METHODS

# INSTANCE METHODS

# PRIVATE METHODS
private

end
