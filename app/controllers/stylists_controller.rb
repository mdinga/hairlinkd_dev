class StylistsController < ApplicationController

  layout :resolve_layout
  helper_method :sort_criteria, :sort_direction
  before_action :get_category, :only => [:edit, :update]

  def index
    searchable_stylists
  end

  def show
    @stylist = Stylist.find(params[:id])
    @rating = @stylist.ratings
    @portfolio = @stylist.portfolios
    get_stylist_categories
    @ha

  end

  def new
    @stylist = Stylist.new
  end

  def create
    @stylist = Stylist.new(stylist_params)
    @stylist.add_role :def_stylist

    if @stylist.save
      flash[:notice] = "Profile Created Successfully, Please Log In"
      #RegisterMailer.new_stylist(@stylist).deliver_now
      redirect_to (stylist_access_stylist_login_path)
    else
      render ('new')
    end
  end

  def edit
    @stylist = Stylist.find(params[:id])
    @city = City.all
    end

  def update
    @stylist = Stylist.find(params[:id])
    @city = City.all
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


    if current_user.has_role? :def_stylist
      session[:user_id] = nil
      @stylist.destroy
      flash[:notice] = "Stylist deleted successfully."
      redirect_to (root_path)

    elsif current_user.has_role? :def_admin
      @stylist.destroy
      flash[:notice] = "That stylist was deleted successfully by Admin."
      redirect_to (stylists_path)
    end

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
    params.require(:stylist).permit(:avatar, :username, :name, :surname, :phone, :email, :city_ids, :area_ids, :address, :house_calls, :salon, :about_me, :password, :password_confirmation, :nickname, :facebook_link, :instagram_link, hairstyle_ids:[])
  end

  def ratings_params
    params.require(:rating).permit(:stylist_id, :client_id, :date_of_appointment, :style_id, :rating_1, :rating_2, :rating_3, :rating_4, :rating_5, :total_rating, :return?, :recommend?, :Comment)
  end

  def portfolio_params
    params.require(:portfolio).permit(:image, :stylist_id, :service_id, :details)
  end

  def offering_params
    params.require(:hairstyle_offering).permit(:top_style)
  end

  def assign_role
    @stylist.update_attributes(:role => 'stylist')
  end

  def get_category
    @style = Hairstyle.all
    @all_category = []
    @style.each do |s|
      @all_category << s.category
    end
    @category = @all_category.uniq
  end

  def get_stylist_categories
    @style_cat = []
    @stylist.hairstyles.each do |h|
      @style_cat << h.category
    end
    @cat = @style_cat.uniq
  end

  def get_hair_from_cat(cat)
    @hairstyles = @stylist.hairstyle_offerings.map{|o| o.hairstyle.name if o.hairstyle.catergory == cat}  
  end


  def set_booleans
    @bool_profile = false
    @bool_city = false
    @bool_services = false
    @bool_about = true
    @bool_contact = true
    @bool_portfolio = false
    @profile_complete = false

      @bool_profile = true if @stylist.avatar.nil? == true
      @bool_city = true if @stylist.city_ids.empty? == false
      @bool_services= true if @stylist.service_ids.empty? == false
      @bool_about = false if @stylist.about_me.nil?  || @stylist.about_me.empty?
      @bool_contact = false if @stylist.phone.nil? || @stylist.phone.empty?
      @bool_portfolio = true if @portfolio.count > 0

      if  @bool_city == true && @bool_services == true && @bool_about == false && @bool_contact == false && @bool_portfolio == true
        @profile_complete = true
      end
  end



end
