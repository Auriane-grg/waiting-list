class UserMailer < ApplicationMailer
  default from: 'auriane.gregoire@gmail.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Confirm you inscription to Brest waiting list')
  end
end
