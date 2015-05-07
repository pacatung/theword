class MessagesController < ApplicationController
  before_action :authenticate_user!
    before_action :set_my_photo, :only => [:edit, :update, :destroy]

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
      render :back
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit

  end

  def update
    if @message.update(mge_params)
      flash[:notice] = "Messsage was successfully updated."
      redirect_to messages_path
    else
      render :action => :edit
    end

    respond_to do |format|
      format.html{ redirect_to root_url }
      format.js{ render :template => "messages/update" }
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to messages_path
  end

private

  def mge_params
    params.require(:message).permit(:content, :delivery_date, :user_id, :status, :contact_ids => [])
  end
  def set_my_message
    @message = current_user.messages.find(params[:id])
  end

end
