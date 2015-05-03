class MessagesController < ApplicationController
before_action :authenticate_user!

  def index
    @messages = Message.all
    @message = Message.new
  end

  def new
    @message = Message.new
  end

end
