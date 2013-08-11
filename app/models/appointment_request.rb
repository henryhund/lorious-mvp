class AppointmentRequest < ActiveRecord::Base
# ASSOCIATIONS
  belongs_to :requester, class_name: "User"
  belongs_to :expert, class_name: "Expert"

# VALIDATIONS

# SPECIAL FEATURES

# SCOPES

# DELEGATIONS

# CALLBACKS

# CONFIG METHODS
  def to_s
    "#{self.length} minutes with #{self.expert} - #{self.start_time}"
  end

# CLASS METHODS

# INSTANCE METHODS

# PRIVATE METHODS
private

end
