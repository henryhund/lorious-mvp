class CreditPayoutsController < ApplicationController

	def new
	end

	def create
		number_of_credits = params[:number_of_credits].to_i
		current_user.payout_credits(number_of_credits)
		flash[:notice] = t('credits.payout.success', amount: number_of_credits)
		redirect_to account_url
	end

end
