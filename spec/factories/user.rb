FactoryGirl.define do

	factory :user do
		email "rg3@gmail.com"
		name "Robert Griffin III"
		stripe_customer_id "stripe12345"
		active true

		factory :expert_user do
			username "alwaysbcoding"
		end

	end

end
