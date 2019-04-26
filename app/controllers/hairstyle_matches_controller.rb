class HairstyleMatchesController < ApplicationController

  layout 'application'

  def index
    @matches = HairstyleMatch.where(:hairstyle_request_id => params[:hairstyle_request_id])
  end

  def show
  end

  def new
    @request = HairstyleRequest.find(params[:hairstyle_request_id])
    @offerings = HairstyleOffering.where(:hairstyle_id => @request.hairstyle)
  end

  def create
    create_hairstyle_match
      redirect_back(fallback_location: root_path)
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private

  def match_params
    params.require(:hairstyle_match).permit(:hairstyle_offering_id, :hairstyle_request_id)
  end

end
