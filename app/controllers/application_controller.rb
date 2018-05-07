class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_stylist, :current_client, :current_admin

  def current_stylist
    if session[:user_id].present?
      if Stylist.find(session[:user_id]).role == 'stylist'
        @current_stylist ||= Stylist.find(session[:user_id])
      else
        @current_stylist = nil
      end
    end
  end

  def current_client
    if session[:user_id].present?
      if Client.find(session[:user_id]).role == 'client'
        @current_client ||= Client.find(session[:user_id])
      else
        @current_client = nil
      end
    end
  end

  def current_admin
    if session[:user_id].present?
    if Admin.find(session[:user_id]).role == 'admin'
      @current_admin ||= Admin.find(session[:user_id])
    else
      @current_admin = nil
    end
  end
end


end
