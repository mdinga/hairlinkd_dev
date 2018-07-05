class StylistAccessController < ApplicationController


  layout :resolve_layout

  def stylist_login
  end

  def stylist_menu

  end


  def stylist_attempt_login
  if params[:email].present? && params[:password].present?
    found_stylist = Stylist.where(:email => params[:email]).first
      if found_stylist
        authorized_stylist = found_stylist.authenticate(params[:password])
        #current_user.add_role :log_stylist
      end
  end
  if authorized_stylist
    session[:stylist_id] = authorized_stylist.id
    flash[:notice] = "You are now logged in"
    redirect_to(stylist_path(authorized_stylist.id))
  else
    flash.now[:notice] = "Invalid email/password combination."
    render 'stylist_login'
  end
end

  def stylist_logout
      #current_user.remove_role :log_stylist
      session[:stylist_id] = nil
      flash[:notice] = "You have been logged out"
      redirect_to(root_path)
  end

  def forgot
    #reset form
  end

  def reset
    if params[:email].present?
      @stylist = Stylist.where(:email => params[:email]).first
      @stylist.send_password_reset
      flash.now[:notice] = "Email sent with password reset instructions"
      redirect_to(root_path)
  end

  def password_form
    @stylist = current_user
  end

  def update_password
    @stylist = Stylist.find_by_password_reset_token!(params[:id])
    if @stylist.password_reset_sent_at < 2.hours.ago
      flash[:notice] = "Password has expired"
      redirect_to(stylist_access_forgot_path)
    elsif @stylist.update_attributes(params[:client])
      flash[:notice] = "Password has been reset, you can now log in"
      redirect_to(stylist_access_login_path)
    else
      render 'stylist_login'
    end
  end

  private

  def resolve_layout

    case action_name
      when "stylist_login", "stylist_attempt_login", "forgot", "reset"
        "login"
      when "stylist_menu", "password_form", "update_password"
        "application"
      end
  end


end
