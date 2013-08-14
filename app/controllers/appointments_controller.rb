class AppointmentsController < ApplicationController

  def new
  end

  def new_with_user
    @user = User.find_by_username(params[:username])
  end

  def index
    @appointments = Appointment.all
  end

  def create
    requested_user = User.find(params[:requested_user_id])
    appointment = Appointment.new

    if requested_user.expert?
      appointment.expert_id    = requested_user.id
      appointment.requester_id = current_user.id
      appointment.state = "user_confirmed"
    else
      appointment.expert_id    = current_user.id
      appointment.requester_id = requested_user.id
      appointment.state = "expert_confirmed"
    end

    appointment.length       = params[:length]
    appointment.description  = params[:description]
    appointment.start_time   = -> { Time.now + 1.week }.call

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

  def confirm
    @appointment = Appointment.find(params[:appointment_id])
    if @appointment.update_attributes(state: "pending")
      flash[:notice] = t('appointment.confirm.success')
    else
      flash[:notice] = t('appointment.confirm.failure')
    end
      redirect_to appointment_url(@appointment)
  end

end
