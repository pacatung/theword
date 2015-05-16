class AskAlivesController < ApplicationController

  def confirm
    @ask = AskAlive.find_by_token(params[:token])
    @ask.update(:status => params[:status])

    @ask.user.update(:status => @ask.status)
  end

  def ask_admin
    @users = User.all
  end

  def check_facebook
    User.find_each do |u|
      u.check_facebook!
    end
    redirect_to "/admin"
  end

  def send_ask_mail
    User.where( [ "active_date < ?" , Date.today ] ).each { |u|
        UserMailer.ask_user(u).deliver_now!
        UserMailer.ask_contacts(u).deliver_now!
    }
    redirect_to "/admin"
  end

  def send_theword
    User.where( :status => "dead").find_each do |u|
      u.send_theword
    end
    redirect_to "/admin"
  end

end
