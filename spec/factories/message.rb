FactoryGirl.define do

  factory :message do
    body "this is a sent message"

    factory :message_from_user_to_expert do
      association :from_user, factory: :user
      association :to_user, factory: :expert
    end

    factory :message_from_expert_to_user do
      association :from_user, factory: :expert
      association :to_user, factory: :user
    end

  end

end
