class StylistAccessController < ApplicationController


  layout :resolve_layout

  def stylist_login
  end

  def stylist_menu

  end


  def stylist_attempt_login
  if params[:username].present? && params[:password].present?
    found_stylist = Stylist.where(:username => params[:username]).first
      if found_stylist
        current_user = found_stylist.authenticate(params[:password])
        current_user.add_role :log_stylist
      end
  end
  if current_user
    session[:user_id] = current_user.id
    flash[:notice] = "You are now logged in"
    redirect_to(stylist_path(current_user.id))
  else
    flash.now[:notice] = "Invalid username/password combination."
    render 'stylist_login'
  end
end

  def stylist_logout
      #current_user.remove_role :log_stylist
      session[:user_id] = nil
      flash[:notice] = "You have been logged out"
      redirect_to(root_path)
  end

  private

  def resolve_layout

    case action_name
      when "stylist_login", "stylist_attempt_login"
        "login"
      when "stylist_menu"
        "stylist_menu"
  end

  end
end
