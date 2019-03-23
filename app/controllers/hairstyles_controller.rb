class HairstylesController < ApplicationController
helper_method :sort_column, :sort_direction #To have access to these methods on the application helper

  layout "application"

  def index
    @hairstyle = Hairstyle.order(sort_column+" "+sort_direction)
    @categories = HairstyleCategory.alphabetical
  end

  def show
    @hairstyle = Hairstyle.find(params[:id])
  end

  def new
    @hairstyle = Hairstyle.new
    @categories = HairstyleCategory.alphabetical

  end

  def create
    @hairstyle = Hairstyle.new(hairstyle_params)
    @categories = HairstyleCategory.alphabetical


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
    @categories = HairstyleCategory.all
  end


  def update
    @hairstyle = Hairstyle.find(params[:id])
    @categories = HairstyleCategory.alphabetical

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
    params.require(:hairstyle).permit(:hairstyle_category_id, :hairstyle, :style_description)
  end

  def sort_column
    Hairstyle.column_names.include?(params[:sort]) ?  params[:sort] : "hairstyle"
  end

  def sort_direction
    %w[asc dec].include?(params[:direction]) ? params[:direction] : "asc"

  end


end
