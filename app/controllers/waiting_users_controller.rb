class WaitingUsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @waiting_user = WaitingUser.new
  end

  def create
    @waiting_user = WaitingUser.new(waiting_user_params)
    if @waiting_user.save
      respond_to do |format|
      UserMailer.with(user: @waiting_user).welcome_email.deliver_later
      format.html { redirect_to pages_first_inscription_path(:user => @waiting_user) }
      end
    else
      render 'new'
    end
  end

  private

  def waiting_user_params
    params.require(:waiting_user).permit(:first_name, :last_name, :phone, :email, :queue_position)
  end
end
