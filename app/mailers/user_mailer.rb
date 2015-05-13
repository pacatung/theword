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
    puts "123"
    @user = user
    # @ask = AskAlive.create!( :user => user, :contact => contact )

    user.contacts.where(:check_alive => true).each { |c|
      @ask = AskAlive.create(:user_id => @user.id, :contact_id => c.id)
      mail to: c.email, subject: "theWord 請問#{@user.name}最近如何呢?"
      puts c.email
    }

  end

  def ask_user(user)
    puts "123"
    @user = user
    @ask = AskAlive.create(:user_id => @user.id)
    mail to: user.email, subject: "theWord #{@user.name}你最近如何呢?"
    puts @user.email
  end

  def send_theword(message,receiver)
    @message = message
    @receiver = receiver
    mail to: @receiver.contact.email, subject: "theWord #{@message.user.name}給你留了一封訊息"
  end

end