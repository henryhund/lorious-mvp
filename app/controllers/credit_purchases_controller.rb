class CreditPurchasesController < ApplicationController

	def new
	end

	def create
		number_of_credits = params[:number_of_credits].to_i
		dollar_amount = number_of_credits * 100

		begin

			charge = Stripe::Charge.create(
				amount: 		dollar_amount,
				currency: 	"usd",
				customer: 	current_user.stripe_customer_id
			)

			current_user.credit_purchases.create!({
				stripe_id: 						charge["id"],
				stripe_fee: 					charge["fee"].to_i,
				number_of_credits: 		number_of_credits,
				dollar_amount: 				charge["amount"].to_i
				})

		rescue Stripe::CardError => e
			# HANDLING
		end

		flash[:notice] = t('credits.purchase.success', amount: number_of_credits)
		redirect_to account_url
	end

end
