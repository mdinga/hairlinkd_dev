class AreasController < ApplicationController

  layout "application"

  def index
    @areas = Area.all
  end

  def new

    get_cpt_areas
    get_dbn_areas
    get_jhb_areas
    get_pta_areas

  end

  def create
    get_cpt_areas
    get_dbn_areas
    get_jhb_areas
    get_pta_areas

    @cpt_areas.each do |cpt|
      @a = Area.new(:name => cpt)
      @a.city_id = City.where(:city => "Cape Town").ids.first
      @a.save
    end

    @dbn_areas.each do |dbn|
      @b = Area.new(:name => dbn)
      @b.city_id = City.where(:city => "Durban").ids.first
      @b.save
    end

    @jhb_areas.each do |jhb|
      @c = Area.new(:name => jhb)
      @c.city_id = City.where(:city => "Johannesburg").ids.first
      @c.save
    end

    @pta_areas.each do |pta|
      @d = Area.new(:name => pta)
      @d.city_id = City.where(:city => "Pretoria").ids.first
      @d.save
    end
    redirect_to(areas_path)
  end

  def edit
  end

  def update
  end

  def delete
        @areas = Area.find(params[:id])
  end

  def destroy
    @areas = Area.find(params[:id])
    @areas.destroy
    redirect_to(areas_path)
  end

  def remove_all
    Area.destroy_all
    redirect_to(areas_path)
  end

  private

  def area_params
    params.require(:area).permit(:name, :city_id)
  end

  def get_cpt_areas
    @cpt_areas = []
    @file_dir = File.join(File.dirname(__FILE__), '..', '..', 'lib', 'cities', 'Cape_Town.txt')
    @file = File.open(@file_dir, 'r')
    @file.each_line{|line| @cpt_areas.push line.chomp}
  end

  def get_dbn_areas
    @dbn_areas = []
    @file_dir = File.join(File.dirname(__FILE__), '..', '..', 'lib', 'cities', 'Durban.txt')
    @file = File.open(@file_dir, 'r')
    @file.each_line{|line| @dbn_areas.push line.chomp}
  end

  def get_jhb_areas
    @jhb_areas = []
    @file_dir = File.join(File.dirname(__FILE__), '..', '..', 'lib', 'cities', 'Johannesburg.txt')
    @file = File.open(@file_dir, 'r')
    @file.each_line{|line| @jhb_areas.push line.chomp}
  end

  def get_pta_areas
    @pta_areas = []
    @file_dir = File.join(File.dirname(__FILE__), '..', '..', 'lib', 'cities', 'Pretoria.txt')
    @file = File.open(@file_dir, 'r')
    @file.each_line{|line| @pta_areas.push line.chomp}
  end

end
