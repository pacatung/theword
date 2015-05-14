class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    # current_user.sign_in_count

    if  current_user.messages.count && current_user.contacts.count == 0
      # "/contacts/new"
      profile_path( :from => "signup" )

      # new_contact_path
      # 1. edit profile
      # 2. new_contact_path
    else
      #"/messages"
      messages_path
    end
  end
end
