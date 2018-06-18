class AdminAccessController < ApplicationController


  layout :resolve_layout

  before_action :confirm_admin_login, :except => [:login, :attempt_login, :logout]

  def login
    #Go to view and display login form
  end

  def menu
    #@admin = Admin.find(params[:admin_id])
    #Go to view and display Admin Menu
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_admin = Admin.where(:email => params[:email]).first
        if found_admin
          current_user = found_admin.authenticate(params[:password])
          current_user.add_role :log_admin
        end
    end

    if current_user
      session[:user_id] = current_user.id
      flash[:notice] = "Admin has been logged in successfully"
      redirect_to(admin_path(current_user.id))
    else
      flash.now[:notice] = "Incorrect email/password combination"
      render "login"
    end
  end

  def logout
      current_user.remove_role :log_admin
      session[:user_id] = nil
      redirect_to(admin_access_login_path)
  end

  private

  def confirm_admin_login
    unless session[:user_id]
      flash[:notice] = "Please log in_ Admin"
      redirect_to(admin_access_login_path)
    end
  end

  def resolve_layout

    case action_name
      when "login", "attempt_login"
        "login"
      when "menu"
        "application"
      end
    end

end
