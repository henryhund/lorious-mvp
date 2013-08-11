class AppointmentRequestsController < ApplicationController

  def new
  end

  def new_with_expert
    @expert = Expert.find_by_username(params[:username])
  end

  def create
    appointment_request              = AppointmentRequest.new
    appointment_request.expert_id    = params[:expert_id]
    appointment_request.requester_id = current_user.id
    appointment_request.length       = params[:length]
    appointment_request.description  = params[:description]
    appointment_request.start_time   = -> { Time.now + 1.week }.call
    appointment_request.state        = "pending"

    if appointment_request.save!
      flash[:notice] = t('appointment.request.create.success')
      redirect_to appointment_request_url(appointment_request)
    else
      flash[:error] = t('appointment.request.create.failure')
      new_appointment_request_url
    end

  end

  def show
    @appointment_request = AppointmentRequest.find(params[:id])
  end

end
