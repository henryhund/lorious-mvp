class Expert < User
  has_many :appointment_requests, foreign_key: "expert_id"

  def expert?
    true
  end

end
