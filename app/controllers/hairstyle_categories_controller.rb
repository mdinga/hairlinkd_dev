class HairstyleCategoriesController < ApplicationController

  layout "application"

  def show
    @category = HairstyleCategory.find(params[:id])
  end

  def new
    @category = HairstyleCategory.new
  end

  def create
    @category = HairstyleCategory.new(category_params)

    if @category.save
      flash[:notice] = "Hairstyle Category Created Successfully"
      redirect_to(hairstyles_path)
    else
      flash[:notice] = "Creation of Category Failed, Please try again"
      render "new"
    end
  end

  def edit
    @category = HairstyleCategory.find(params[:id])
  end

  def update
    @category = HairstyleCategory.find(params[:id])

    if @category.update_attributes(category_params)
      flash[:notice] = "Category Updated Successfully"
      redirect_to(hairstyles_path)
    else
      flash[:notice] = "Updating of Category Failed, Please try again"
      render 'edit'
    end
  end

  def delete
    @category = HairstyleCategory.find(params[:id])
  end

  def destroy
    @category = HairstyleCategory.find(params[:id])
    @category.destroy
    flash[:notice] = "Category Deleted Successfully"
    redirect_to(hairstyles_path)
  end

  private
    def category_params
      params.require(:hairstyle_category).permit(:name, :description)
    end

end
