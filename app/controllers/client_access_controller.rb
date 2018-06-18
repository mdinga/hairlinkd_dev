class ClientAccessController < ApplicationController


  layout :resolve_layout

  def login
    #will display login form for clients
  end

  def menu
    #menu page after login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_client = Client.where(:username => params[:username]).first
      if found_client
        current_user = found_client.authenticate(params[:password])
        current_user.add_role :log_client
      end
    end

    if current_user
      session[:user_id] = current_user.id
      flash[:notice] = "You are now logged in"
      redirect_to(client_path(current_user.id))
    else
      flash.now[:notice] = "Invalid username/password combination"
      render 'login'
    end

  end

  def logout
    #current_user.remove_role :log_client
    session[:user_id] = nil
    flash[:notice] = "You have been logged out"
    redirect_to(root_path)
  end

  def forgot
    #reset form
  end

  def attempt_reset

  end

  private

  def resolve_layout

    case action_name
      when "login", "attempt_login", 'forgot', 'attempt_reset'
        "login"
      when "menu"
        "client_menu"
  end

  end



end
