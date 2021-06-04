class PagesController < ApplicationController
  def first_inscription
    @user = WaitingUser.find(params[:user])
  end


  def queue_position
    @waiting_user = WaitingUser.find(params[:id])
  end
end
