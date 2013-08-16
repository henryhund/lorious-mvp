class Appointment < ActiveRecord::Base
# ASSOCIATIONS
  belongs_to :requester, class_name: "User"
  belongs_to :expert, class_name: "Expert"
  has_many :messages
  has_many :appointment_reviews

# VALIDATIONS
  before_create do
    raise AppointmentError.new(:create, "cannot create appointment with yourself") if self.expert_id == self.requester_id
  end

# SPECIAL FEATURES

## STATE MACHINE
  # user_confirmed, expert_confirmed, unpaid, pending, in_progress, completed, cancelled
  before_create do
    self.state = "user_confirmed" if !self.state
  end

# SCOPES
  scope :completed, -> { where(state: "completed") }

# DELEGATIONS

# CALLBACKS
  before_validation(on: :create) do

    if self.requester.credit_balance < calculate_credits_to_charge
      raise AppointmentError.new(:create, "requester does not have enough credits")
    else
      self.number_of_credits = calculate_credits_to_charge
    end
  end

# CONFIG METHODS
  def to_s
    "#{self.display_state} || #{self.length} minutes with #{self.expert} - #{self.start_time}"
  end

# CLASS METHODS

# INSTANCE METHODS
  def reviewed_by_user?(user)
    self.appointment_reviews.map(&:user_id).include?(user.id) ? true : false
  end

  def completed?
    return true if self.state == "completed"
  end

  def display_state
    case self.state
    when "user_confirmed" then "waiting for confirmation from the expert"
    when "expert_confirmed" then "waiting for confirmation from the user"
    when "pending" then "CONFIRMED"
    end
  end

# PRIVATE METHODS
private
  def calculate_credits_to_charge
    return ( expert.hourly_rate * length / 60.0 )
  end

end
