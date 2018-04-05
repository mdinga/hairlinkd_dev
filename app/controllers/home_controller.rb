class HomeController < ApplicationController

  layout 'home'

  def index
    @stylist = Stylist.top_rating.only_3
  end

end
