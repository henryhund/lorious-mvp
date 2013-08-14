class Expert < User
  has_many :appointments, foreign_key: "expert_id"
  has_many :taggings
  has_many :tags, through: :taggings

  validates :hourly_rate, presence: true, numericality: true

  def expert?
    true
  end

end
