FactoryGirl.define do

  factory :expert do
    email "rg3@gmail.com"
    firstname "Robert"
    lastname "Griffin III"
    stripe_customer_id "stripe12345"
    active true
    credit_balance 0

    type "Expert"
    username "alwaysbcoding"
    hourly_rate 25
  end

end
