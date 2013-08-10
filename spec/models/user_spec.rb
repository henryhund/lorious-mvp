require 'spec_helper'

describe User do

	context "creating stripe customer" do

		it "saves the stripe customer id in the database" do
			user = FactoryGirl.create(:user)
			user.create_stripe_customer("token")
			user.stripe_customer_id.should eq "cus_1234"
		end

		it "saves the last 4 digits of the credit card on the user" do
			user = FactoryGirl.create(:user)
			user.create_stripe_customer("token")
			user.last_4_digits.should eq "4242"
		end

		it "saves the downcased card type of the credit card on the user" do
			user = FactoryGirl.create(:user)
			user.create_stripe_customer("token")
			user.card_type.should eq "visa"
		end

	end

end
