class ClientAccessController < ApplicationController


  layout :resolve_layout

  def login
    #will display login form for clients
  end

  def menu
    #menu page after login
  end

  def attempt_login
    if params[:email].downcase.present? && params[:password].present?
      found_client = Client.where(:email => params[:email].downcase).first
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
      @client = Client.where(:email => params[:email].downcase).first
      @client.send_password_reset if @client
      @client.update_attributes(:password => @randowm_password)
      flash.now[:notice] = "New password has been sent to your mail"
      redirect_to (root_path)
  end

  def password_form
    @client = Client.where(:password_reset_token => params[:password_reset_token]).first
  end

  def update_password
    @client = Client.where(:password_reset_token => params[:password_reset_token]).first
    if @client.password_reset_sent_at < 2.hours.ago
      redirect_to (client_access_forgot_path)
      flash[:notice] = "Password has expired"
    elsif @client.update_attributes(password_params)
      flash[:notice] = "Password has been reset"
      redirect_to (client_access_login_path)
    else
      render 'password_form'
    end
  end

  private

  def resolve_layout
      case action_name
        when "login", "attempt_login", 'forgot', 'reset', "password_form", "update_password"
          "login"
        when "menu"
          "application"
        end
  end

  def password_params
    params.require(:client).permit(:password, :password_confirmation)
  end



end
