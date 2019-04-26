class ClientsController < ApplicationController

  layout :resolve_layout

  before_action :get_service_cat, :only => [ :show_stylist]


  helper_method :sort_criteria, :sort_direction

  def index
    @client = Client.all
  end

  def show
    @client = Client.find(params[:id])
    @matches = HairstyleMatch.where(:hairstyle_request => @client.hairstyle_request)
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.add_role :def_client

    if @client.save

      flash[:notice] = "Profile Created Successfully, Please Log In"
      RegisterMailer.new_client(@client).deliver_now
      redirect_to (client_access_login_path)
    else
      render ('new')
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update

    @client = Client.find(params[:id])

    if @client.update_attributes(client_params)
      redirect_to (client_path(@client, :client_id => @client.id))
    else
      render ('edit')
    end
  end

  def delete
    @client = Client.find(params[:id])
  end

  def destroy
    @client = Client.find(params[:id])

    if current_user.has_role? :def_client
        session[:user_id] = nil
        @client.destroy
        flash[:notice] = "Your profile has been deleted and you have been logged out"
        redirect_to(root_path)
      elsif current_user.has_role? :def_admin
        @client.destroy
        flash[:notice] = "That client was deleted successfully by Admin."
        redirect_to(clients_path)
      end
    end


def show_stylists
  @stylist = Stylist.find(params[:id])
  @rating = @stylist.ratings
  @portfolio = @stylist.portfolios.paginate(:page => params[:page], :per_page => 3)
end

def show_style
  @style = Style.find(params[:id])
end

def index_styles
    @style = Style.all
end

def create_fav_styles
    @style = Style.find(params[:style_id])

    unless current_user.styles.include?(@style)
      current_user.styles << @style
      flash[:notice] = "Like Updated"
      redirect_to (show_style_client_path(:client_id => current_user.id, :style_id => @style.id))
    else
      flash[:notice] = "You Already Like This Style"
      redirect_to (show_style_client_path(:client_id => current_user.id, :style_id => @style.id))
    end
end

def destroy_fav_styles
    @style = Style.find(params[:style_id])
    current_user.styles.delete(@style)
    flash[:notice] = "Dislike Updated"
    redirect_to (show_style_client_path(:client_id => current_user.id, :style_id => @style.id))
end

def create_fav_stylists
  @stylist = Stylist.find(params[:stylist_id])

  unless current_user.stylists.include?(@stylist)
    current_user.stylists << @stylist
    flash[:notice] = "Like Updated"
    redirect_to(stylist_path(@stylist))
  else
    flash[:notice] = "You Already Like This Stylist"
    redirect_to(stylist_path(@stylist))
  end
end

def destroy_fav_stylists
  @stylist = Stylist.find(params[:stylist_id])
  current_user.stylists.delete(@stylist)
  flash[:notice] = "Dislike Updated"
  redirect_to(stylist_path(@stylist))
end

private

  def resolve_layout

    case action_name
      when 'new', 'create', 'delete', 'destroy'
        'menu'
      when 'show', 'index', 'edit', 'index_styles', 'show_style'
        'application'
      end
  end

  def client_params
    params.require(:client).permit(:picture, :username, :name, :surname, :email, :password, :password_confirmation, :city, :area, :favourite_hairstyles, :favourite_products, :favourites_gallery, :favourite_stylists, :nickname)
  end

  def delete_this_client
    @client.ratings.destroy_all #delete all the stylists ratings
    #@client.fav_styles.destroy_all #delete all favourite styles
    #@client.fav_stylists.destroy_all #delete all favourite stylists

    @client.destroy
  end

  def get_service_cat
    @serv_cat = []
    @file_dir = File.join(File.dirname(__FILE__), '..', '..', 'lib', 'services', 'categories.txt')
    @file = File.open(@file_dir, 'r')
    @file.each_line{|line| @serv_cat.push line.chomp}
  end

  def services_array
    @services_cat = Array.new
      @stylist.services.each do |s|
        @services_cat << s.category
      end
    @cats = @services_cat.uniq
  end

end
