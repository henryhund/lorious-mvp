class UsersController < ApplicationController

	def show
	end

	def profile
		@expert = User.find_by_username(params[:username])
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

	def new_bank_account
	end

	def create_bank_account
		if current_user.create_stripe_bank_account(params[:stripeToken])
			flash[:notice] = t('user.payment.add_bank_account.success')
		else
			flash[:error] = t('user.payment.add_bank_account.failure')
		end
		redirect_to account_url
	end

	def credits
		@credit_transactions = current_user.credit_purchases | current_user.credit_payouts
		@credit_transactions.sort! { |a, b| a.created_at <=> b.created_at }.reverse!
	end

	def mailbox
	end

end
