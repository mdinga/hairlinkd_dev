class CitiesController < ApplicationController

  layout "admin"

  def index
    @city = City.all
  end

  def show
  end

  def new
  end

  def create
    get_cities

    @city_name.each do |c|
      city = City.new(:city => c)
      city.save
    end
    redirect_to(cities_path)

  end

  def edit
  end

  def update
  end

  def delete
    @city = City.find(params[:id])
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
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
