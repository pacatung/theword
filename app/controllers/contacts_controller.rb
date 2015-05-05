class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def show
    @contact = current_user.contacts.find(params[:id])
  end

  def create
    @contact = current_user.contacts.new(set_contact)

    if @contact.save
      redirect_to messages_path
    else
      render :new
    end
  end

  def update
    @contact = current_user.contacts.find(params[:id])

    if @contact.update(set_contact)
      redirect_to messages_path
    else
      render :show
    end
  end

  def destroy
    current_user.contacts.find(params[:id]).destroy
    redirect_to messages_path
  end

  def set_contact
    params.require(:contact).permit(:name, :phone, :home_phone, :email, :address)
  end
end
