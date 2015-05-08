class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_my_message, :only => [:edit, :update, :destroy]

  def index
    @messages = current_user.messages.order("id DESC")
    @message = Message.new
    @contacts = current_user.contacts.only_check_alive
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if params["commit"] == "草稿"
      @message.status = "draft"
    end
    if @message.save
      flash[:notice] = "message was successfully created!!"
      @message.create_message_notify
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

    respond_to do |format|
      if @message.update(message_params)
        format.html{ redirect_to root_url }
        format.js{ render :template => "messages/index" }
      else
        format.html { render :template => "messages/edit" }
        format.js
      end
    end

  end

  def destroy
    @message.destroy

    respond_to do |format|
      format.html{ redirect_to root_url }
      format.js{ render :template => "messages/destroy" }
    end

  end

  private

  def message_params
    params.require(:message).permit(:content, :delivery_date, :user_id, :status, :contact_ids => [])
  end
  def set_my_message
    @message = current_user.messages.find(params[:id])
  end

end
