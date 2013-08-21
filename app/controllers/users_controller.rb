class UsersController < ApplicationController
	before_action :require_username, except: [:edit, :update]

	def show
	end

	def profile
		@user = User.find_by_username(params[:username])
	end

	def edit
	end

	def update
		params_to_use = current_user.expert? ? expert_params : user_params
		if current_user.update_attributes(params_to_use)
			current_user.update_tags(params[:tags]) if current_user.expert?
			flash[:notice] = t('user.update.success')
			redirect_to account_url
		else
			flash[:notice] = t('user.update.failure')
			redirect_to edit_user_url(current_user)
		end
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
		@credit_transactions = (current_user.credit_purchases | current_user.credit_payouts).sort! { |a, b| a.created_at <=> b.created_at }.reverse!
	end

	def mailbox
	end

	def calendar
	end

private
	def user_params
		params.require(:user).permit(:username, :firstname, :lastname, :display_name, :website)
	end

	def expert_params
		params.require(:user).permit(:username, :firstname, :lastname, :display_name, :website, :bio, :hourly_rate, :tagline)
	end

end
