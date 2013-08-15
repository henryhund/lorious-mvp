class PagesController < ApplicationController

	def homepage
    @action = "homepage"
	end

  def waitinglist

    add_to_list(params[:fname], params[:email])
    redirect_to root_url, notice: t("waitinglist.success")

  end

  def sample_profile

  end

  private

  def add_to_list(name, email, list_id=MAILCHIMP_LIST_ID)
    fname = name.split[0]
    #set up Mailchimp API
    gb = Gibbon::API.new(MAILCHIMP_API_KEY)
    gb.throws_exceptions  = false

    #Add subscriber, do not send double opt-in message
    gb.lists.subscribe({id: list_id, email: {email: email}, double_optin: false, merge_vars: { FNAME: fname } })
  end


end
