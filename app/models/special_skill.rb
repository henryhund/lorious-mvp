class SpecialSkill < ActiveRecord::Base
# ASSOCIATIONS
  belongs_to :expert

# VALIDATIONS

# SPECIAL FEATURES

# SCOPES

# DELEGATIONS

# CALLBACKS

# CONFIG METHODS
  def to_s
    "#{self.title} - #{self.body}"
  end

# CLASS METHODS

# INSTANCE METHODS

# PRIVATE METHODS
private

end
