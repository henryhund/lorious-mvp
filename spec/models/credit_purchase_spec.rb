require 'spec_helper'

describe CreditPurchase do

	context "validations" do

		it "does not let the user purchase a negative amount of credits" do
			user = FactoryGirl.create(:user)
			expect { user.purchase_credits(-10) }.to raise_error(CreditPurchaseError)
		end

		it "does not let the user purchase zero credits" do
			user = FactoryGirl.create(:user)
			expect { user.purchase_credits(0) }.to raise_error(CreditPurchaseError)
		end

	end

	context "purchases" do

		it "updates the users credit balance after purchase" do
			user = FactoryGirl.create(:user)
			user.purchase_credits(50)
			user.credit_balance.should eq 50
		end

		it "creates a new credit purchase object" do
			user = FactoryGirl.create(:user)
			user.purchase_credits(50) ; credit_purchase = user.credit_purchases.first
			credit_purchase.stripe_id.should eq "charge_1234"
			credit_purchase.stripe_fee.should eq 103
			credit_purchase.number_of_credits.should eq 50
			credit_purchase.dollar_amount.should eq 5000
		end

	end

end
