class MessagesController < ApplicationController
before_action :authenticate_user!

  def index
    @messages = Message.all.order("id DESC")
    @message = Message.new
    @contacts = current_user.contacts
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

  def show

  end

  def edit

  end

  def update

  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to messages_path
  end

private

  def mge_params
    params.require(:message).permit(:content, :delivery_date, :user_id, :status)
  end
end
