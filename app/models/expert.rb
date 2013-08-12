class Expert < User
  has_many :appointments, foreign_key: "expert_id"

  validates :hourly_rate, presence: true, numericality: true

  def expert?
    true
  end

end
