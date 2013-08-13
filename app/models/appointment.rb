class Appointment < ActiveRecord::Base
# ASSOCIATIONS
  belongs_to :requester, class_name: "User"
  belongs_to :expert, class_name: "Expert"
  has_many :messages
  has_many :appointment_reviews

# VALIDATIONS

# SPECIAL FEATURES

# SCOPES

# DELEGATIONS

# CALLBACKS
  before_validation(on: :create) do
    if self.requester.credit_balance < calculate_credits_to_charge
      raise AppointmentError.new(:create, "requester does not have enough credits")
    else
      self.number_of_credits = calculate_credits_to_charge
    end
  end

  before_create do
    self.state = "user_confirmed"
  end

# CONFIG METHODS
  def to_s
    "#{self.length} minutes with #{self.expert} - #{self.start_time}"
  end

# CLASS METHODS

# INSTANCE METHODS
  def reviewed_by_user?(user)
    self.appointment_reviews.map(&:user_id).include?(user.id) ? true : false
  end

# PRIVATE METHODS
private
  def calculate_credits_to_charge
    return ( expert.hourly_rate * length / 60.0 )
  end

end
