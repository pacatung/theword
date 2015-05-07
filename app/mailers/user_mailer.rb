class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_comment.subject
  #
  def notify_comment(user,message)
    @greeting = "Hi"
    @user = user
    @message = message
    mail to: user.email, subject: "you add theword"
  end
end
