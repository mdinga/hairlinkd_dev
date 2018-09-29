class HomeController < ApplicationController

  layout :resolve_layout

  def index
    @stylist_3 = Stylist.top_rating.only_3
    @stylist_count = Stylist.all.count
    @portfolio_count = Portfolio.all.count
    @last_stylist = Stylist.last(3)
  end

  def construction
  end

private

  def resolve_layout

    case action_name
      when 'index'
        'application'
      when 'construction'
        'construction'
      end
  end


end
