class StylistsController < ApplicationController

  layout :resolve_layout

    #after_action :assign_role, :only => :create

helper_method :sort_criteria, :sort_direction

  def index
    searchable_stylists
  end

  def show
    @stylist = Stylist.find(params[:id])
    @rating = @stylist.ratings
    @portfolio = @stylist.portfolios
  end

  def new
    @stylist = Stylist.new
  end

  def create
    @stylist = Stylist.new(stylist_params)
    @stylist.add_role :def_stylist

    if @stylist.save
      flash[:notice] = "Profile Created Successfully, Please Log In"
      redirect_to (stylist_access_stylist_login_path)
    else
      render ('new')
    end
  end

  def edit
    @stylist = Stylist.find(params[:id])
    @city = City.all
    get_service_cat
  end

  def update
    @stylist = Stylist.find(params[:id])
    @city = City.all
    get_service_cat

      if  @stylist.update_attributes(stylist_params)
        flash[:notice] = "Stylist updated created successfully."
        redirect_to(stylist_path(@stylist))
      else
        render 'edit'
      end
  end

  def delete
    @stylist = Stylist.find(params[:id])
  end

  def destroy
    @stylist = Stylist.find(params[:id])
    @stylist.ratings.destroy_all #delete all the stylists ratings
    @stylist.portfolios.destroy_all #delete all the stylists portfolio
    @stylist.cities.destroy_all
    @stylist.areas.destroy_all
    @stylist.destroy
    session[:user_id] = nil
    flash[:notice] = "Stylist deleted successfully."
    redirect_to (root_path)
  end


  private

  def resolve_layout

    case action_name
        when 'new', 'create', 'delete', 'destroy'
          'menu'
        when 'show', 'index'
          'application'
          end
  end

  def stylist_params
    params.require(:stylist).permit(:avatar, :username, :name, :surname, :phone, :email, :city_ids, :area_ids, :address, :house_calls, :salon, :about_me, :password, :password_confirmation, :facebook_link, :instagram_link, service_ids:[])
  end

  def ratings_params
    params.require(:rating).permit(:stylist_id, :client_id, :date_of_appointment, :style_id, :rating_1, :rating_2, :rating_3, :rating_4, :rating_5, :total_rating, :return?, :recommend?, :Comment)
  end

  def portfolio_params
    params.require(:portfolio).permit(:image, :stylist_id, :service_id, :details)
  end

  def assign_role
    @stylist.update_attributes(:role => 'stylist')
  end

  def get_service_cat
    @serv_cat = []
    @file_dir = File.join(File.dirname(__FILE__), '..', '..', 'lib', 'services', 'categories.txt')
    @file = File.open(@file_dir, 'r')
    @file.each_line{|line| @serv_cat.push line.chomp}
  end


end
