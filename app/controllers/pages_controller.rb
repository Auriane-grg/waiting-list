class PagesController < ApplicationController

  #  Page seen just after submitting the new user form :
  def first_registration
    @user = WaitingUser.find(params[:id])
  end

  # Page of the email sent every 15 days :
  def queue_position
    @waiting_user = WaitingUser.find(params[:id])

    # test when programming on development environnement are commented below :
    minutes = 10
    days = 0
    day_delay = 0
    minute_delay = 15

    # production values :
    # minutes = 0
    # days = 20
    # day_delay = 5
    # minute_delay = 0

    d15 = days * 86400 + minutes * 60
    # 1j = 86400s

    now = Time.now.to_i
    if (@waiting_user.last_validation == nil || now >= ((@waiting_user.last_validation) + d15))
      @waiting_user.update_attributes(last_validation: now)
      @waiting_user.update_attributes(to_be_cancelled: false)
    end
    
    waiting_users = WaitingUser.where('last_validation < ?', @waiting_user.last_validation)
    @count_waiting = waiting_users.count
    # @waiting_user.update_attributes(queue_position: (count_waiting+1)) 
  end

  # Page seen when the user is deleted because he did not confirm his interest for the waiting list after 20 days :
  def cancel_registration
    @canceling_user = WaitingUser.find(params[:id])
    # @waiting_users = WaitingUser.where('queue_position > ?', @canceling_user.queue_position)
    # @waiting_users.each do |user| 
    #   user.update_attributes(queue_position: (user.queue_position-=1))
    # end
  end

end