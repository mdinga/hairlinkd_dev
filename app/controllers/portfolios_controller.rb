class PortfoliosController < ApplicationController

  layout :resolve_layout

    def index
      @portfolio = Portfolio.all
    end

    def show_client
      @portfolio = Portfolio.find(params[:id])
    end

    def show_stylist
      @portfolio = Portfolio.find(params[:id])
    end

    def show_admin
      @portfolio = Portfolio.find(params[:id])
    end

    def new
      @portfolio = Portfolio.new(:stylist_id => current_stylist.id)
      @service = Service.all
    end

    def create
      @portfolio = Portfolio.create(portfolio_params)
      @service = Service.all

      if @portfolio.save
        redirect_to (stylist_path(current_stylist))
        flash[:notice] = "Item Added To Your Portfolio"
      else
        flash[:notice] = "Oops, Something Is Not Right, Please Try Again"
        render("new")
      end

    end

    def edit
      @portfolio = Portfolio.find(params[:id])
      @service = Service.all
    end

    def update
      @portfolio = Portfolio.find(params[:id])
      @service = Service.all

      if  @portfolio.update_attributes(portfolio_params)
        redirect_to (stylist_path(current_stylist))
        flash[:notice] = "Your Portfolio Has Been Updated"
      else
        flash[:notice] = "Oops, Something Is Not Right, Please Try Again"
        render 'edit'
      end

    end

    def delete
      @portfolio = Portfolio.find(params[:id])
    end

    def destroy
      @portfolio = Portfolio.find(params[:id])
      @portfolio.destroy
      flash[:notice] = "Item Removed From Your Portfolio"
      redirect_to (stylist_path(current_stylist))
    end

    private

    def portfolio_params
      params.require(:portfolio).permit(:image, :stylist_id, :service_id, :details)
    end

    def resolve_layout
      case action_name
      when 'index', 'show_admin', 'show_client', 'show_stylist'
        'admin'
      when 'new', 'create', 'edit', 'update', 'delete', 'destroy'
        'stylist_menu'
      end
    end

end
