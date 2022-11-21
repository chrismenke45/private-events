class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: %i[ destroy ]
  before_action :authenticate_user!

  # POST /enrollments or /enrollments.json
  def create
    @enrollment = enrollment.new

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to enrollment_url(@enrollment), notice: "enrollment was successfully created." }
        format.json { render :show, status: :created, location: @enrollment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrollments/1 or /enrollments/1.json
  def destroy
    @enrollment.destroy

    respond_to do |format|
      format.html { redirect_to enrollments_url, notice: "enrollment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_enrollment
    @enrollment = enrollment.find(params[:id])
  end
end
