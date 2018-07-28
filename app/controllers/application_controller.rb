class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :path_to_stylist
def current_user

# @current_user =
#     if session[:admin_id]
#       @current_admin_user = Admin.find(session[:admin_id])
#       @current_admin_user if @current_admin_user.has_role?(:def_admin)
#     elsif session[:stylist_id]
#       @current_stylist_user = Stylist.find(session[:stylist_id])
#       @current_stylist_user if @current_stylist_user.has_role?(:def_stylist)
#     elsif session[:client_id]
#       @current_client_user = Client.find(session[:client_id])
#       @current_client_user if @current_client_user.has_role?(:def_client)
#     else
#        nil
#    end
# end


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


def searchable_stylists
  @stylist = Stylist.search(params[:search]).find_city(params[:place]).find_area(params[:sub_place]).order(sort_criteria + " " + sort_direction)

  @stylist_all = Stylist.all

  @cities =[]
    @stylist.each do |s|
      s.cities.each do |c|
        @cities << c.city
      end
    end

  @area =[]
    @stylist.each do |s|
      s.areas.each do |a|
        @area << a.name
      end
    end
 end

   def sort_criteria
     Stylist.column_names.include?(params[:sort]) ? params[:sort] : "overall_rating"
   end

   def sort_direction
     %w[ASC DESC].include?(params[:direction]) ? params[:direction] : "DESC"
   end

   def path_to_stylist(arg)
       stylists_path(arg)
   end


end
