class StylesController < ApplicationController

  layout "admin"

  before_action :get_style_names, :get_style_cats, :get_stylists_and_clients, :only => [:new, :create, :edit, :update]


  def index
    @style = Style.all
  end

  def show
    @style = Style.find(params[:id])
  end

  def new
    @style = Style.new
  end

  def create
      @style = Style.create(style_params)

        if @style.save
          redirect_to(style_path(@style))
        else
          render 'new'
        end

  end

  def edit
    @style = Style.find(params[:id])
  end

  def update
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
    params.require(:style).permit(:image, :style_name, :category, :sub_category, :details, :stylist_id, :client_id, :popularity)
  end

  def get_style_names
    @style_type = []
    @file_dir = File.join(File.dirname(__FILE__), '..', '..', 'lib', 'styles', 'style_names.txt')
    @file = File.open(@file_dir, 'r')
    @file.each_line{|line| @style_type.push line}
  end

  def get_style_cats
    @style_cat = []
    @file_dir = File.join(File.dirname(__FILE__), '..', '..', 'lib', 'styles', 'style_categories.txt')
    @file = File.open(@file_dir, 'r')
    @file.each_line{|line| @style_cat.push line}
  end

  def get_stylists_and_clients
    @stylist = Stylist.all
    @client = Client.all
  end






end
