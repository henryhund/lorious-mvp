FactoryGirl.define do

  factory :appointment_request do
    association :requester, factory: :user, credit_balance: 100
    association :expert, factory: :expert_user
    length 60
  end

end
