class AppointmentReviewsController < ApplicationController

  def create
    review = AppointmentReview.new appointment_id: params[:appointment_id], user_id: current_user.id, summary: params[:summary]
    if review.save!
      flash[:notice] = t('appointment.review.create.success')
      redirect_to appointment_url(params[:appointment_id])
    else
      flash[:error] = t('appointment.review.create.failure')
      redirect_to appointment_url(params[:appointment_id])
    end
  end

end
