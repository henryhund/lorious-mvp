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
			user = FactoryGirl.create(:user, credit_balance: 100)
			user.payout_credits(42) ; credit_payout = user.credit_payouts.first
			credit_payout.stripe_id.should eq "payout_1234"
			credit_payout.stripe_fee.should eq 25
			credit_payout.number_of_credits.should eq 42
			credit_payout.dollar_amount.should eq 4200
		end

	end

end
