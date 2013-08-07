class UsersController < ApplicationController

	def new_card
	end

	def create_card
		if current_user.create_stripe_customer(params[:stripeToken])
			flash[:notice] = t('user.payment.add_card.success')
			redirect_to root_url
		else
			flash[:error] = t('user.payment.add_card.failure')
		end
	end

end
