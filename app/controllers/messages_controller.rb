class MessagesController < ApplicationController

  def new
  end

  def new_with_expert
  end

  def create
    appointment, to_user = params[:appointment_id], User.find_by_username(params[:to_user_username])
    message = Message.new appointment_id: appointment, from_user: current_user, to_user: to_user, subject: params[:subject], body: params[:body]
    if message.save!
      flash[:notice] = t('message.on_appointment.create.success')
      if appointment.present?
        redirect_to appointment_url(appointment)
      else
        redirect_to mailbox_url
      end
    else
      flash[:error] = "Message could not be added"
      redirect_to root_url
    end
  end

end
