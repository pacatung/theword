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
    mail to: user.email, subject: "theWord 我們收到你新增的微遺言"
  end

  def ask_contacts(user)
    @user = user
    mail_list = user.contacts.map{|c|
      c.email if c.check_alive
    }
    mail to: mail_list, subject: "theWord 請問#{@user.name}最近如何呢?"
  end

  def ask_user(user)
    @user = user
    mail to: user.email, subject: "theWord #{@user.name}你最近如何呢?"
  end

  def send_theword(message,receiver)
    @message = message
    @receiver = receiver
    mail to: @receiver.contact.email, subject: "theWord #{@message.user.name}給你留了一封訊息"
  end

end