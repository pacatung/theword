class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if  current_user.messages.count && current_user.contacts.count == 0
      "/contacts/new"
    else
      "/messages"
    end
  end
end
