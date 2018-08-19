class HomeController < ApplicationController

  layout :resolve_layout

  def index
    @stylist_3 = Stylist.top_rating.only_3
    @stylist_count = Stylist.all.count
    @portfolio_count = Portfolio.all.count
  end

  def construction
  end

private

  def resolve_layout

    case action_name
      when 'index'
        'home'
      when 'construction'
        'construction'
      end
  end


end
