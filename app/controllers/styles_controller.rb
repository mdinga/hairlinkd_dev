class StylesController < ApplicationController

  layout "application"

  before_action :get_stylists_and_clients, :only => [:new, :create, :edit, :update]


  def index
    @style = Style.all
  end

  def show
    @style = Style.find(params[:id])
  end

  def new
    @service = Service.all
    @style = Style.new
  end

  def create
    @service = Service.all
      @style = Style.create(style_params)

        if @style.save
          redirect_to(style_path(@style))
        else
          render 'new'
        end

  end

  def edit
    @service = Service.all
    @style = Style.find(params[:id])
  end

  def update
    @service = Service.all
    @style = Style.find(params[:id])

      if @style.update_attributes(style_params)
        redirect_to(style_path(@style))
      else
        render ('edit')
      end

  end

  def delete
      @style = Style.find(params[:id])
  end

  def destroy
    @style = Style.find(params[:id])
    @style.destroy
    redirect_to (styles_path)
  end

  private

  def style_params
    params.require(:style).permit(:image, :style_name, :service_id, :details, :stylist_id, :client_id, :popularity)
  end

  def get_stylists_and_clients
    @stylist = Stylist.all
    @client = Client.all
  end






end
