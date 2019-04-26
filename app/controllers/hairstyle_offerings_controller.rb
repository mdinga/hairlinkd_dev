class HairstyleOfferingsController < ApplicationController

  layout "application"

  def index
    @offerings = HairstyleOffering.where(:stylist_id => current_user.id)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @offering = HairstyleOffering.find(params[:id])
      if @offering.top_style
        @offering.update_attributes(:top_style => 0)
        flash[:notice] ="Top style removed"
      redirect_back(fallback_location: root_path)
      else
        @offering.update_attributes(:top_style => 1)
        flash[:notice] ="Top Style loaded"
        redirect_back(fallback_location: root_path)
      end

  end

  def delete
  end

  def destroy
  end

  private

  def offerings_params
    params.require(:hairstyle_offering).permit(:top_style)
  end
end
