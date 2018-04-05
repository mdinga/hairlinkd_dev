class ServicesController < ApplicationController

  layout "admin"

  def index
    @services = Service.all
  end

  def show
    @services = Service.find(params[:id])
  end

  def new
    @service = Service.new
    get_service_cat
  end

  def create
    @service = Service.new(service_params)
    get_service_cat
    if @service.save
      flash[:notice] = "Service has been added"
      redirect_to(services_path)
    else
      flash[:notice] = "Service has not been added"
      render 'new'
    end
  end

  def edit
    @service = Service.find(params[:id])
    get_service_cat

  end

  def update
    @service = Service.find(params[:id])
    get_service_cat

    if @service.update_attributes(service_params)
      flash[:notice] = "Service has been updated"
      redirect_to(services_path)
    else
      flash[:notice] = "Updating of Service Failed, Please try again"
      render 'edit'
    end

  end

  def delete
      @service = Service.find(params[:id])
  end

  def destroy
      @service = Service.find(params[:id])
      @service.destroy
  end

  private

  def service_params
    params.require(:service).permit(:name, :category, :description)
  end

  def get_service_names
    @serv_names = []
    @file_dir = File.join(File.dirname(__FILE__), '..', '..', 'lib', 'services', 'names.txt')
    @file = File.open(@file_dir, 'r')
    @file.each_line{|line| @serv_names.push line.chomp}
  end

  def get_service_cat
    @serv_cat = []
    @file_dir = File.join(File.dirname(__FILE__), '..', '..', 'lib', 'services', 'categories.txt')
    @file = File.open(@file_dir, 'r')
    @file.each_line{|line| @serv_cat.push line.chomp}
  end

end
