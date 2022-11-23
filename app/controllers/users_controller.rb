class UsersController < ApplicationController
  def show
    @user = User.includes(:hosted_events).includes(:attended_events).find(params[:id])
  end
end
