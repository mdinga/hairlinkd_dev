class HairstylesController < ApplicationController

  layout "application"

  def index
    @hairstyle = Hairstyle.order(params[:sort])
  end

  def show
    @hairstyle = Hairstyle.find(params[:id])
  end

  def new
    @hairstyle = Hairstyle.new
    get_style_names
    get_style_cats
  end

  def create
    @hairstyle = Hairstyle.create(hairstyle_params)
    get_style_names
    get_style_cats

    if @hairstyle.save
      flash[:notice] = "Hairstyle Created Successfully"
      redirect_to(hairstyles_path)
    else
      flash[:notice] = "Creation of Hairstyle Failed, Please try again"
      render 'new'
    end
  end

  def edit
    @hairstyle = Hairstyle.find(params[:id])
    get_style_names
    get_style_cats
  end


  def update
    @hairstyle = Hairstyle.find(params[:id])
    get_style_names
    get_style_cats

    if @hairstyle.update_attributes(hairstyle_params)
      flash[:notice] = "Hairstyle Updated Successfully"
      redirect_to(hairstyles_path)
    else
      flash[:notice] = "Updating of Hairstyle Failed, Please try again"
      render 'edit'
    end
  end

  def delete
        @hairstyle = Hairstyle.find(params[:id])
  end

  def destroy
        @hairstyle = Hairstyle.find(params[:id])
        @hairstyle.destroy
        flash[:notice] = "Hairstyle Deleted Successfully"
        redirect_to(hairstyles_path)
  end

  private

  def hairstyle_params
    params.require(:hairstyle).permit(:hairstyle, :style_category, :style_description)
  end

  def get_style_names
    @style_name = []
    @file_dir = File.join(File.dirname(__FILE__), '..', '..', 'lib', 'styles', 'style_names.txt')
    @file = File.open(@file_dir, 'r')
    @file.each_line{|line| @style_name.push line.chomp}

  end

  def get_style_cats
    @style_cat = []
    @file_dir = File.join(File.dirname(__FILE__), '..', '..', 'lib', 'styles', 'style_categories.txt')
    @file = File.open(@file_dir, 'r')
    @file.each_line{|line| @style_cat.push line.chomp}
  end


end
