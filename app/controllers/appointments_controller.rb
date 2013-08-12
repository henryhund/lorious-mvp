class AppointmentsController < ApplicationController

  def new
  end

  def new_with_expert
    @expert = Expert.find_by_username(params[:username])
  end

  def create
    appointment              = Appointment.new
    appointment.expert_id    = params[:expert_id]
    appointment.requester_id = current_user.id
    appointment.length       = params[:length]
    appointment.description  = params[:description]
    appointment.start_time   = -> { Time.now + 1.week }.call
    appointment.state        = "pending"

    if appointment.save!
      flash[:notice] = t('appointment.create.success')
      redirect_to appointment_url(appointment)
    else
      flash[:error] = t('appointment.create.failure')
      new_appointment_url
    end

  end

  def show
    @appointment = Appointment.find(params[:id])
  end

end
