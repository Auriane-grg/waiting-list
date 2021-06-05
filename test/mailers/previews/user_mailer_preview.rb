# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def welcome_email
    UserMailer.with(user: WaitingUser.first).welcome_email
  end

  def confirmation_email
    UserMailer.with(user: WaitingUser.first).confirmation_email
  end

  def cancelled_email
    UserMailer.with(user: WaitingUser.first).cancelled_email
  end
end
