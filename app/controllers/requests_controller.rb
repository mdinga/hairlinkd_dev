class RequestsController < ApplicationController

  before_action :get_cities, :only => [:new, :create, :edit, :update]
  before_action :get_services, :only => [:new, :create, :edit, :update]

  def index

    if current_user.has_role? :def_client
      @requests = current_user.requests

    else
      @requests = Request.recent_first
    end

  end

  def show
    @request = Request.find(params[:request_id])
  end

  def new
    @request = Request.new(:client_id => current_user.id)
  end

  def create
    @request = Request.new(request_params)
    @client = current_user

    if @request.save
      flash[:notice] ="Your request created and sent the stylists in your area"
      redirect_to requests_path
    else
      flash[:notice] ="Your request was not successful"
      render 'new'
    end
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])

    if @request.update_attributes(request_params)
      flash[:notice] = "Your request has been updated"
      redirect_to(requests_path)
    else
      flash[:notice] = "We were unable to update your request, please try again"
      render 'edit'
    end

  end

  def delete
    @request = Request.find(params[:id])
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    flash[:notice] = "Your request has been deleted"
    redirect_to(client_path(current_user))
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :image, :budget, :client_id, :city_id, :service_id)
  end

  def get_cities
    @city = City.all
  end

  def get_services
    @service = Service.alphabetically
  end


end
