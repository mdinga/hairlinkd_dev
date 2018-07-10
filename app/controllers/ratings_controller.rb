class RatingsController < ApplicationController

  layout 'application'

  before_action :get_tables, :only => [:new, :create, :edit, :update]


  #after_action :get_overall_rating, :only => [:new, :create, :edit, :update]

    def index
      @rating = Rating.all
      # This is where the list of all the ratings of the stylists will be controlled
    end

    def show
      @rating = Rating.find(params[:id])
      @stylist = Stylist.find(@rating.stylist_id)
      @client = Client.find(@rating.client_id)

    end

    def show_client
      @rating = Rating.find(params[:id])
      @stylist = @rating.stylist_id
      @client = @rating.client_id
    end

    def show_stylist
      @rating = Rating.find(params[:id])
      @client = @rating.client_id
    end

    def show_admin
      @rating = Rating.find(params[:id])
      @stylist = @rating.stylist_id
      @client = @rating.client_id
    end

    def new
      @stylist = Stylist.find(params[:stylist_id])
      @rating = Rating.new(:client_id => current_user.id, :stylist_id => @stylist.id)
    end

    def create
      #creating of new rating of the particular stylist

      @rating = Rating.new(rating_params)

        if @rating.save

          get_average_rating
          add_to_overall_rating

          flash[:notice] = "Rating successful"
          redirect_to (rating_path(@rating, :stylist_id => @rate.stylist.id))
        else
          render ('new')
        end
    end

    def edit
      @rating = Rating.find(params[:id])
    end

    def update
      @rating = Rating.find(params[:id])

        if  @rating.update_attributes(rating_params)
          get_average_rating
          update_overall_rating
          flash[:notice] = "Rating Updated Successfully"
          redirect_to(rating_path(@rating, :stylist_id => @hstylist.id))
        else
          flash[:notice] = "Oops!! Something went wrong, please try again"
          render 'edit'
        end
    end

    def delete
      @rating = Rating.find(params[:id])
    end

    def destroy
      @rating = Rating.find(params[:id])
      @rating.destroy
      update_overall_rating
      flash[:notice] = "Your Rating Has Been Deleted"
      redirect_to (index_stylists_clients_path(current_user.id))
    end

  private
    def rating_params
      params.require(:rating).permit(:stylist_id, :client_id, :date_of_appointment, :style_id, :rating_1, :rating_2, :rating_3, :rating_4, :rating_5, :total_rating, :return, :recommend, :Comment)
    end

    def get_average_rating
      @avg = [@rating.rating_1, @rating.rating_2, @rating.rating_3, @rating.rating_4, @rating.rating_5]
      @rating.update_attributes(:total_rating => @avg.instance_eval { reduce(:+) / size.to_f })
    end

    def add_to_overall_rating
      @rate = Rating.find(@rating.id)
      @sr = Rating.where(:stylist_id => @rate.stylist)
      @hstylist = Stylist.find(@rate.stylist.id)
      @arr = @sr.map{|c| c.total_rating}
      @hstylist.update_attributes(:overall_rating => @arr.instance_eval { reduce(:+) / size.to_f })
    end

    def update_overall_rating
      @sr = Rating.where(:stylist_id => @rating.stylist.id)
      @hstylist = Stylist.find(@rating.stylist.id)
      @arr = @sr.map{|c| c.total_rating}
        if @sr.count == 0
          @hstylist.update_attributes(:overall_rating => 0.0)
        else
        @hstylist.update_attributes(:overall_rating => @arr.instance_eval { reduce(:+) / size.to_f })
        end
    end

    def get_tables
      @stylist = Stylist.all
      @client = Client.all
      @style = Style.all
    end

    def resolve_layout
      case action_name
      when 'index', 'show', 'show_admin', 'new', 'create', 'edit', 'update', 'delete', 'destroy'
        'admin'
      when 'show_stylist'
        'application'
      when 'show_client'
        'application'
      end
    end





end
