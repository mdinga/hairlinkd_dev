class ResponsesController < ApplicationController

  def index
  end

  def show

    #@response = @request.responses.find{|r| r[:stylist_id] == current_user.id}
    @response = Response.find(params[:id])
    @request = @response.request
  end

  def new
    @request = Request.find(params[:request_id])
    @response = Response.new(:stylist_id => current_user.id, :request_id => @request.id)
  end


  def create
    @response = Response.new(response_params)
    @stylist = current_user
    #@request = Request.find(params[:request_id])

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

  private

  def response_params
    params.require(:response).permit(:message, :request_id, :stylist_id)
  end
end
