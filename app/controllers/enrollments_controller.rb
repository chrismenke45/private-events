class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: %i[ destroy ]
  before_action :authenticate_user!

  # POST /enrollments or /enrollments.json
  def create
    #@enrollment = Enrollment.new
    @enrollment = current_user.enrollments.new
    #@enrollment.attendee_id = current_user.id
    @enrollment.attended_event_id = params[:event_id]

    if @enrollment.save
      redirect_to controller: :events, action: :show, id: params[:event_id], notice: "You are now attending this event"
    else
      redirect_to controller: :events, action: :show, id: params[:event_id], notice: "Something went wrong"
    end
  end

  # DELETE /enrollments/1 or /enrollments/1.json
  def destroy
    redirect_to controller: :events, action: :show, id: params[:event_id], notice: "You can't remove a different user from this event!" unless @enrollment.attendee_id == current_user.id
    if @enrollment.destroy
      redirect_to controller: :events, action: :show, id: params[:event_id], notice: "You are no longer attending this event"
    else
      flash[:notice] = "Something went wrong"
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end
end
