FactoryGirl.define do

  factory :appointment do
    association :requester, factory: :user, credit_balance: 100
    association :expert, factory: :expert
    length 60
  end

end
