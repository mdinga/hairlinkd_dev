class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :path_to_stylist
def current_user

# function to identify the current user
    if session[:user_id]
      @user = User.find(session[:user_id])
        @current_user =
          if  @user.operator_type == "Admin"
              Admin.find(@user.operator.id)
          elsif @user.operator_type == "Stylist"
              Stylist.find(@user.operator.id)
          elsif @user.operator_type == "Client"
              Client.find(@user.operator.id)
          else
              nil
          end
        end
end
#---------------------------------------------------------------------------------------

# Function to search for stylists in the stylists gallery (currently inactive)

def searchable_stylists
  @stylist = Stylist.search(params[:search]).find_city(params[:place]).find_area(params[:sub_place]).order(sort_criteria + " " + sort_direction).paginate(:per_page => 12, :page => params[:page])
  @stylist_all = Stylist.all

  @cities =[]
    @stylist_all.each do |s|
      s.cities.each do |c|
        @cities << c.city
      end
    end

  @area =[]
    @stylist_all.each do |s|
      s.areas.each do |a|
        @area << a.name
      end
    end
 end


# Function to sort the stylist gallery by rating and by decending or accending (currently inactive)
   def sort_criteria
     Stylist.column_names.include?(params[:sort]) ? params[:sort] : "overall_rating"
   end

   def sort_direction
     %w[ASC DESC].include?(params[:direction]) ? params[:direction] : "DESC"
   end

   def path_to_stylist(arg)
       stylists_path(arg)
   end

#---------------------------------------------------------------------------------------------------

#functions for the Hairstyle Matching Algorithm (used for the Hairstyle Request controller and HairstyleMatch Controller)

def create_hairstyle_match
  #@request = HairstyleRequest.find(params[:hairstyle_request_id])
  @offerings = []
  @offerings = HairstyleOffering.where(:hairstyle_id => @request.hairstyle)

  @offerings.each do |o|
    HairstyleMatch.create(:hairstyle_request => @request, :hairstyle_offering => o)
  end

  def update_hairstyle_match
    @match.destroy_all
    @offerings = []
    @offerings = HairstyleOffering.where(:hairstyle_id => @request.hairstyle)

    @offerings.each do |o|
      HairstyleMatch.create(:hairstyle_request => @request, :hairstyle_offering => o)
    end
  end


end



end
