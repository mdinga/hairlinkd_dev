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
    @stylist = Stylist.where(:email => params[:email]).first
    @stylist.send_password_reset if @stylist
    redirect_to(root_path)
    flash[:notice] = "Email sent with password reset instructions"
  end

  def password_form
    @stylist = Stylist.where(:password_reset_token => params[:password_reset_token]).first
  end

  def update_password
    @stylist = Stylist.where(:password_reset_token => params[:password_reset_token]).first
      if @stylist.password_reset_sent_at < 2.hours.ago
        redirect_to (stylist_access_forgot_path)
        flash[:notice] = "Password has expired"
      elsif @stylist.update_attributes(password_params)
        redirect_to (stylist_access_stylist_login_path)
        flash[:notice] = "Password has been reset"
      else
        render "password_form"
      end
  end



  private

  def resolve_layout

    case action_name
      when "stylist_login", "stylist_attempt_login", "forgot", "reset", "password_form", "update_password"
        "login"
      when "stylist_menu"
        "application"
      end
  end

  def password_params
    params.require(:stylist).permit(:password, :password_confirmation)
  end


end
