require 'spec_helper'

describe CreditPayout do

	context "validations" do

		it "does not let the user payout a negative amount of credits" do
			user = FactoryGirl.create(:user)
			expect { user.payout_credits(-10) }.to raise_error(CreditPayoutError)
		end

		it "does not let the user purchase zero credits" do
			user = FactoryGirl.create(:user)
			expect { user.payout_credits(0) }.to raise_error(CreditPayoutError)
		end

	end

	context "payouts" do

		it "updates the users credit balance after payout" do
			user = FactoryGirl.create(:user, credit_balance: 100)
			user.payout_credits(42)
			user.credit_balance.should eq 58
		end

		it "creates a new credit payout object" do
		# 	user = FactoryGirl.create(:user)
		# 	user.purchase_credits(50) ; credit_purchase = user.credit_purchases.first
		# 	credit_purchase.stripe_id.should eq "charge_1234"
		# 	credit_purchase.stripe_fee.should eq 103
		# 	credit_purchase.number_of_credits.should eq 50
		# 	credit_purchase.dollar_amount.should eq 5000
		end

	end

end
