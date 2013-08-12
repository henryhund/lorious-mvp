class Message < ActiveRecord::Base
# ASSOCIATIONS
  belongs_to :appointment
  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"
  belongs_to :conversation, class_name: "Message"
  has_many :replies, class_name: "Message", foreign_key: "conversation_id"

# VALIDATIONS

# SPECIAL FEATURES

# SCOPES
  scope :in_reply_to, ->(message) { where(conversation: message) }
  scope :ordered, -> { order("created_at") }
  scope :unread_by_user, ->(user) { where(to_user: user, viewed: false) }

# DELEGATIONS

# CALLBACKS

# CONFIG METHODS
  def to_s
    "From: #{self.from_user} - #{self.body}"
  end

# CLASS METHODS

# INSTANCE METHODS

# PRIVATE METHODS
private

end
