class MessagesController < ApplicationController

  def index
    @messages = Message.all.order("id DESC")
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(mge_params)
    @message.user = current_user
    if @message.save
      flash[:notice] = "message was successfully created!!"
      redirect_to messages_path
    else
      render :action => :new
    end
  end

private

  def mge_params
    params.require(:message).permit(:content, :delivery_date, :user_id, :status)
  end
end
