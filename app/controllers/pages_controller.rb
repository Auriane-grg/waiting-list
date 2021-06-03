class PagesController < ApplicationController
  def queue_position
    @waiting_user = WaitingUser.find(params[:id])
  end
end
