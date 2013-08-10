FactoryGirl.define do

	factory :user do
		email "rg3@gmail.com"
		firstname "Robert"
		lastname "Griffin III"
		stripe_customer_id "stripe12345"
		active true
		credit_balance 0

		factory :expert_user do
			username "alwaysbcoding"
		end

		after(:build) do |user|
			user.stub(:create_stripe_customer_api_call).and_return(OpenStruct.new(id: "cus_1234", cards: [OpenStruct.new(last4: "4242", type: "Visa")]))
			user.stub(:purchase_credits_from_stripe_api_call).and_return(OpenStruct.new(id: "charge_1234", fee: "103", amount: "5000"))
			user.stub(:create_stripe_bank_account_api_call).and_return(OpenStruct.new(id: "rp_1234", active_account: OpenStruct.new(last4: "6789", bank_name: "STRIPE TEST BANK")))
			user.stub(:payout_credits_from_stripe_api_call).and_return(OpenStruct.new(id: "payout_1234", fee: "25", amount: "4200"))
		end

	end

end
