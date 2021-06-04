class WaitingUsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @waiting_user = WaitingUser.new
  end

  def create
    @waiting_user = WaitingUser.new(waiting_user_params)
    # @waiting_user.queue_position = (WaitingUser.count) +1
    respond_to do |format|
      if @waiting_user.save
        UserMailer.with(user: @waiting_user).welcome_email.deliver_later
        format.html { redirect_to pages_first_inscription_path(:user => @waiting_user) }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def waiting_user_params
    params.require(:waiting_user).permit(:first_name, :last_name, :phone, :email, :queue_position)
  end
end
