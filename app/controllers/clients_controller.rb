class ClientsController < ApplicationController

  layout :resolve_layout

  #before_action :find_current_client, :only => [:show]
  #after_action :send_login_mail, :only => :create

  helper_method :sort_criteria, :sort_direction

  def index
    @client = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.add_role :def_client
    if @client.save
      flash[:notice] = "Profile Created Successfully, Please Log In"

      RegisterMailer.new_client.deliver_now

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
    @client.ratings.destroy_all
    @client.destroy
    session[:user_id] = nil
    flash[:notice] = "Your profile has been deleted and you have been logged out"
    redirect_to(root_path)
  end

def index_stylists
  searchable_stylists
   #@client = Client.find(params[:id])
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

    unless current_client.styles.include?(@style)
      current_client.styles << @style
      flash[:notice] = "Like Updated"
      redirect_to (show_style_client_path(:client_id => current_client.id, :style_id => @style.id))
    else
      flash[:notice] = "You Already Like This Style"
      redirect_to (show_style_client_path(:client_id => current_client.id, :style_id => @style.id))
    end
end

def destroy_fav_styles
    @style = Style.find(params[:style_id])
    current_client.styles.delete(@style)
    flash[:notice] = "Dislike Updated"
    redirect_to (show_style_client_path(:client_id => current_client.id, :style_id => @style.id))
end

def create_fav_stylists
  @stylist = Stylist.find(params[:stylist_id])

  unless current_client.stylists.include?(@stylist)
    current_client.stylists << @stylist
    flash[:notice] = "Like Updated"
    redirect_to(show_stylists_client_path(@stylist, :client_id => current_client.id))
  else
    flash[:notice] = "You Already Like This Stylist"
    redirect_to(show_stylists_client_path(@stylist, :client_id => current_client.id))
  end
end

def destroy_fav_stylists
  @stylist = Stylist.find(params[:stylist_id])
  current_client.stylists.delete(@stylist)
  flash[:notice] = "Dislike Updated"
  redirect_to(show_stylists_client_path(@stylist, :client_id => current_client.id))
end

private

  def resolve_layout

    case action_name
      when 'new', 'create', 'delete', 'destroy'
        'menu'
      when 'show', 'index', 'edit', 'index_stylists', 'show_stylists', 'index_styles', 'show_style'
        'application'
      end
  end

  def client_params
    params.require(:client).permit(:username, :name, :surname, :email, :password, :password_confirmation, :city, :area, :favourite_hairstyles, :favourite_products, :favourites_gallery, :favourite_stylists, :nickname)
  end

  def send_login_mail

  end



end
