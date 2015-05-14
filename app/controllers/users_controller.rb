class UsersController < ApplicationController
before_action :authenticate_user!

  def show
    @user = current_user
  end

  def update
    if current_user.update(set_user)
      if params[:from] == "signup"
        redirect_to new_contact_path
      else
        redirect_to messages_path
      end
    else
      redirect_to :back
    end
  end

  def set_user
    params.require(:user).permit(:name, :email, :address, :phone, :home_phone)
  end

end
