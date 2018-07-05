class ClientAccessController < ApplicationController


  layout :resolve_layout

  def login
    #will display login form for clients
  end

  def menu
    #menu page after login
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_client = Client.where(:email => params[:email]).first
      if found_client
        authorized_client = found_client.authenticate(params[:password])
        #current_user.add_role :log_client
      end
    end

    if authorized_client
      session[:client_id] = authorized_client.id
      flash[:notice] = "You are now logged in"
      redirect_to(client_path(authorized_client.id))
    else
      flash.now[:notice] = "Invalid email/password combination"
      render 'login'
    end

  end

  def logout
    #current_user.remove_role :log_client
    session[:client_id] = nil
    flash[:notice] = "You have been logged out"
    redirect_to(root_path)
  end

  def forgot
    #reset form
  end

  def reset
    if params[:email].present?
      @client = Client.where(:email => params[:email]).first
      @client.send_password_reset
      flash.now[:notice] = "Email sent with password reset instructions"
      redirect_to(root_path)
    end
  end

  def password_form
    @client = Client.find_by_password_reset_token!(params[:id])
  end

  def update_password
    @client = Client.find_by_password_reset_token!(params[:id])
    if @client.password_reset_sent_at < 2.hours.ago
      flash[:notice] = "Password has expired"
      redirect_to(client_access_forgot_path)
    elsif @client.update_attributes(params[:client])
      flash[:notice] = "Password has been reset, you can now log in"
      redirect_to(client_access_login_path)
    else
      render 'login'
    end
  end

  private

  def resolve_layout
      case action_name
        when "login", "attempt_login", 'forgot', 'reset'
          "login"
        when "menu", "password_form", "update_password"
          "application"
        end
  end

  def password_params
    params.require(:client).permit(:password, :password_confirmation)
  end



end
