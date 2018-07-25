class AdminsController < ApplicationController

  layout :resolve_layout

  before_action :get_service_cat, :only => [ :show_stylist]

  def index
    @admin = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.create(admin_params)
    @admin.add_role :def_admin

    if @admin.save
        flash[:notice] = "Admin Created Successfully"
        redirect_to(admin_path)
      else
        render 'new'
    end

  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])

    if @admin.update_attributes!(admin_params)
      flash[:notice] = "Admin Updated Successfully"
      redirect_to(admin_path)
    else
      flash[:notice] = "Update Failed: Try Again"
      render "edit"
    end
  end

  def delete
    @admin = Admin.find(params[:id])
  end

  def destroy
    @admin = Admin.find(params[:id])
    flash[:notice] = "Admin deleted successfully."
    redirect_to (admin_path)
  end
#-----------------------------------------------------------------------------
# The following is for controlling Clients through Admin Profiles

  def index_clients
    @client = Client.all
  end

  def show_client
    @client = Client.find(params[:id])
    @ratings = @client.ratings
  end

  def edit_client
    @client = Client.find(params[:id])
  end

  def update_client
    @client = Client.find(params[:id])

    if @client.update_attributes(client_params)
      redirect_to (show_client_admin_path(@client))
    else
      render ('edit_client')
    end
  end

  #-----------------------------------------------------------------------------
  # The following is for controlling Stylists through Admin Profiles

  def show_stylist
    @stylist = Stylist.find(params[:id])
    @rating = @stylist.ratings
    @portfolio = @stylist.portfolios
  end

  #-----------------------------------------------------------------------------
  # The following is for controlling Ratings through Admin Profiles

  def index_ratings
    @rating = Rating.all
  end

  def show_rating
    @rating = Rating.find(params[:id])
  end




  private

  def resolve_layout

    case action_name
        when 'new', 'create', 'delete', 'destroy'
          'menu'
        else
          'application'
        end
  end

  def admin_params
    params.require(:admin).permit(:name, :surname, :email, :password)
  end

  def client_params
    params.require(:client).permit(:username, :name, :surname, :email, :password, :city, :area, :favourite_hairstyles, :favourite_products, :favourites_gallery, :favourite_stylists)
  end

  def get_service_cat
    @serv_cat = []
    @file_dir = File.join(File.dirname(__FILE__), '..', '..', 'lib', 'services', 'categories.txt')
    @file = File.open(@file_dir, 'r')
    @file.each_line{|line| @serv_cat.push line.chomp}
  end

end
