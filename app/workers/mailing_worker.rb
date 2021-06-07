class MailingWorker
  include Sidekiq::Worker

  def perform
    now = Time.now.to_i

    # test when programming on development environnement are commented below :
    # minutes = 1
    # days = 0
    # day_delay = 0
    # minute_delay = 5

    # production values :
    minutes = 0
    days = 15
    day_delay = 5
    minute_delay = 0

    d15 = days * 86400 + minutes * 60
    d20 = d15 + day_delay * 86400 + minute_delay * 60
    # 1j = 86400s
    # print 'd15 = ', d15, ' day20 = ', d20, ' now = ', now
    # select all users to be removed from the waiting list :
    # their last validation is more than 20 days ago
    users_20_days = WaitingUser.where('last_validation <= ?', now-d20)
    # p users_20_days
    # p d20
    # p now
    


    # select all users who need to receive a confirmation email :
    # their last validation is more than 20 days ago and they did not received the confirmation email in the past 5 days
    users_15_days = WaitingUser.where('last_validation <= ?', now - d15).where(to_be_cancelled: false)
    # p users_15_days
    # p d15

    users_15_days.each do |user|
      # p 'confirm ', user.first_name
      UserMailer.with(user: user).confirmation_email.deliver_later
      # p 'mail confirm sending'
      user.update_attributes(to_be_cancelled: true)
      # p'cancel attribute to true'
    end

    users_20_days.each do |user|
      UserMailer.with(user: user).cancel_email.deliver_later
      # p 'destroy user ', user.first_name
      user.destroy
    end

  end

end


# To do : here, if someone register to the waiting list but never confirm, he/she will stay in the db
# he / she won't be in the waiting list (last validaton will be unset) but be in the db
# To do : destroy this kind of personn 20 days after their creation date even
# Here, this people are not taken into the worker this the definition of the targeted people to destroy is based on the last validation field
# I did not code that part by lack of time -> my creation date and my validation date are not based on the same time zone, need to convert or so