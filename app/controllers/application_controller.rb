class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_stylist, :current_client, :current_admin
  helper_method :redirect_search, :sort_criteria, :sort_direction

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

def redirect_search(arg)
    if current_client.role == 'admin'
      index_stylists_clients_path(arg)
    elsif current_stylist.role == 'stylist'
      stylists_path(arg)
    end
end

def searchable_stylists
  @stylist = Stylist.search(params[:search]).find_city(params[:place]).find_area(params[:sub_place]).order(sort_criteria + " " + sort_direction).paginate(:page => params[:page], :per_page => 16)

  @stylist_all = Stylist.all
  @cities =[]
    @stylist.each do |s|
      s.cities.each do |c|
        @cities << c.city
      end
    end

  @area =[]
    @stylist.each do |s|
      s.areas.each do |a|
        @area << a.name
      end
    end
 end

 def sort_criteria
   Stylist.column_names.include?(params[:sort]) ? params[:sort] : "overall_rating"
 end

 def sort_direction
   %w[ASC DESC].include?(params[:direction]) ? params[:direction] : "DESC"
 end


end
