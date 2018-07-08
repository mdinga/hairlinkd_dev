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
    require "securerandom"
    if params[:email].present?
      @stylist = Stylist.where(:email => params[:email]).first
      @randowm_password = SecureRandom.hex(5)
      @stylist.update_attributes(:password => @randowm_password)
      flash.now[:notice] = "New password has been sent to your mail"
      render 'stylist_login'
    else
      flash.now[:notice] = "No such email here"
      render 'forgot'
    end
  end

  def password_form
    @stylist = current_user
  end

  def update_password
    @stylist = current_user
    if @stylist.update_attributes(password_params)
      flash[:notice] = "Your password has been successfully changed"
      redirect_to(stylist_path(@stylist))
    else
      flash[:notice] = "Oops something went wrong, please try again"
      render 'password_form'
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

  def password_params
    params.require(:stylist).permit(:password, :password_confirmation)
  end


end
