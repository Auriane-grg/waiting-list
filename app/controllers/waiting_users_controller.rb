class WaitingUsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @waiting_user = WaitingUser.new
  end

  def create
    @waiting_user = WaitingUser.new(waiting_user_params)
    @waiting_user.queue_position = (WaitingUser.count) +1
    if @waiting_user.save
      redirect_to pages_queue_position_path(:id => @waiting_user.id)
    else
      render :new
    end
  end

  private

  def waiting_user_params
    params.require(:waiting_user).permit(:first_name, :last_name, :phone, :email, :queue_position)
  end
end
