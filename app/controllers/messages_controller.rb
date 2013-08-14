class MessagesController < ApplicationController

  def new
  end

  def new_with_expert
  end

  def create
    appointment = params[:appointment_id]
    message = Message.new appointment_id: appointment, from_user: current_user, body: params[:body]
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
