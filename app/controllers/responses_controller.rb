class ResponsesController < ApplicationController

  def index
  end

  def show
  end

  def new
    @response = Response.new
    @stylist = current_user
    @request = Request.find(params[:request_id])
  end


  def create
    @response = Response.new
    @stylist = current_user
    @request = Request.find(params[:request_id])

    if @response.save
      flash[:notice] = "Your response has been sent to the client"
      redirect_to(requests_path)
    else
      flash[:notice] = "Your response was not sent, please try again"
      render 'new'
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
