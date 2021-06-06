class UserMailer < ApplicationMailer
  default from: 'auriane.gregoire@gmail.com'

  # Email received right after submiting the form to get on the waiting list
  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Confirm you registration to Brest waiting list')
  end

  # Email received every 15 days
  def confirmation_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Warning: still looking for a coworking place?')
    p 'test confirmation mail \n'
  end

  # Email received if the last validation was 20 days ago
  def cancel_email
    @user = params[:user]
    mail(to: @user.email, subject: 'You\'re no longer on the waiting list for Brest Coworking')
    p 'test cancel mail \n'
  end
end
