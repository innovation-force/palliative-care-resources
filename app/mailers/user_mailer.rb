class UserMailer < ApplicationMailer
  def verify_email(user)
    @user = user
    mail(to: @user.email, subject: 'Verify your CareLibrary email address')
  end

  def password_reset_email(user)
    @user = user
    mail(to: @user.email, subject: 'Reset your CareLibrary password')
  end
end
