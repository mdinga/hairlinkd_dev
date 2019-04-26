class HairstyleRequestsController < ApplicationController

  layout "application"

  def index
    @requests = HairstyleRequest.where(:client_id => params[:client_id])
  end

  def show
    @request = HairstyleRequest.find(params[:id])
  end

  def new
    @request = HairstyleRequest.new(:client_id => params[:client_id])
    @hairstyles = Hairstyle.all

  end

  def create
    @request = HairstyleRequest.new(request_params)
    @hairstyles = Hairstyle.all
    if @request.save
      create_hairstyle_match
      flash[:notice] ="Your request has been created"
      redirect_to (client_path(@request.client.id))
    else
      flash[:notice] ="Your request was not successful"
      render 'new'
    end

  end

  def edit
    @request = HairstyleRequest.find(params[:id])
    @hairstyles = Hairstyle.all
    @match = HairstyleMatch.where(:hairstyle_request => @request)
  end

  def update
    @request = HairstyleRequest.find(params[:id])
    @hairstyles = Hairstyle.all
    @match = HairstyleMatch.where(:hairstyle_request_id => @request.id)


    if @request.update_attributes(request_params)
      update_hairstyle_match
      flash[:notice] = "Your request has been updated"
      redirect_to(client_path(@request.client))
    else
      flash[:notice] = "Your request failed to load"
      render "edit"
    end
  end

  def delete
    @request = HairstyleRequest.find(params[:id])
  end

  def destroy
    @request = HairstyleRequest.find(params[:id])
    @request.destroy
    flash[:notice] = "Hair Request Deleted"
    redirect_back(fallback_location: root_path)
  end

  private

  def request_params
    params.require(:hairstyle_request).permit(:client_id, :hairstyle_id)
  end


end
