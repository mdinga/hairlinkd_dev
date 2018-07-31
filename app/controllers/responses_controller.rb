class ResponsesController < ApplicationController

  def index
    @request = Request.find(params[:request_id])
    @responses = @request.responses
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
      flash[:notice] = "Your response has been sent to the client. Be on the look out for the reply"
      redirect_to(requests_path)
    else
      flash[:notice] = "Your response was not sent, please try again"
      render 'new'
    end

  end

  def edit
    @response = Response.find(params[:id])
    @request = @response.request
  end

  def update
    @response =Response.find(params[:id])
    @request = @response.request

    if @response.update_attributes(response_params)
      flash[:notice] = "Your response was updated successfully. Be on the look out for the reply"
      redirect_to(response_path(@response))
    else
      flash[:notice] = "Unable to update your response, please try again"
    end

  end


  def destroy
    @response =Response.find(params[:id])
    @response.destroy
    flash[:notice] = "Your response was deleted"
    redirect_to(requests_path)
  end

  private

  def response_params
    params.require(:response).permit(:message, :request_id, :stylist_id)
  end
end
