class CitiesController < ApplicationController

  layout "application"

  def index
    @city = City.all
  end

  def show
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save
      flash[:notice] = "A city has been added"
      redirect_to(cities_path)
    end
  end

  def create_all
    get_cities

    @city_name.each do |c|
      city = City.new(:city => c)
      city.save
    end
    redirect_to(cities_path)

  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
      if @city.update_attributes(city_params)
        flash[:notice] = "City has been updated"
        redirect_to(cities_path)
      end
  end

  def delete
    @city = City.find(params[:id])
  end

  def destroy
    @city = City.find(params[:id])
    @city.areas.destroy_all
    @city.destroy
    redirect_to(cities_path)
  end

  def delete_all
    City.destroy_all
    redirect_to(cities_path)
  end

  private

  def city_params
    params.require(:city).permit(:city)
  end

  def get_cities
    @city_name = []
    @file_dir = File.join(File.dirname(__FILE__), '..', '..', 'lib', 'cities', 'Cities.txt')
    @file = File.open(@file_dir, 'r')
    @file.each_line{|line| @city_name.push line.chomp}
  end

end
