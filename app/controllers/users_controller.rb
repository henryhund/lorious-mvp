class UsersController < ApplicationController

	def show
	end

	def new_card
	end

	def create_card
		if current_user.create_stripe_customer(params[:stripeToken])
			flash[:notice] = t('user.payment.add_card.success')
		else
			flash[:error] = t('user.payment.add_card.failure')
		end
		redirect_to account_url
	end

	def credits
		@credit_transactions = current_user.credit_purchases
	end

end
