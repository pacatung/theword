class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_my_message, :only => [:edit, :update, :destroy]

  def index
    @messages = current_user.messages.includes( :receivers => :contact ).order("id DESC")
    @message = Message.new
    @contacts = current_user.contacts.includes( :receivers ).only_check_alive

    @all_contacts = current_user.contacts.includes(:receivers)

    @contact = Contact.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(multi_file_types_params)
    @message.user = current_user
    if params["commit"] == "草稿" || @message.receivers.first == nil
      @message.status = "draft"
    end
    if @message.save
      flash[:notice] = "message was successfully created!!"
      @message.create_message_notify
      redirect_to messages_path
    else
      redirect_to :back
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def edit
  end

  def update
    if params["commit"] == "草稿"
      @message.status = "draft"
    else
      @message.status = "final"
    end

    respond_to do |format|
      if @message.update(message_params)
        format.html{ redirect_to root_url }
        format.js{ render :action => "index" }
      else
        format.html { render :action => "edit" }
        format.js
      end
    end
  end

  def destroy
    @message.destroy

    respond_to do |format|
      format.html{ redirect_to root_url }
      format.js
    end
  end

  private

  def message_params
    params[:message][:contact_ids] = Array(params[:message][:contact_ids]).uniq

    params.require(:message).permit(:content, :delivery_date, :user_id, :status, :image, :audio, :video, :contact_ids => [])
  end

  def set_my_message
    @message = current_user.messages.find(params[:id])
  end

  def multi_file_types_params

    params[:message][:contact_ids] = Array(params[:message][:contact_ids]).uniq

    if params[:message][:foo]
      if params[:message][:foo].content_type.include? 'image'
        params[:message][:image] = params[:message][:foo]
      elsif params[:message][:foo].content_type.include? 'video'
        params[:message][:video] = params[:message][:foo]
      elsif params[:message][:foo].content_type.include? 'audio'
        params[:message][:audio] = params[:message][:foo]
      end
    end

    params[:message].delete :foo
    params.require(:message).permit(:content, :delivery_date, :user_id, :status, :image, :audio, :video, :contact_ids => [])
  end

end
