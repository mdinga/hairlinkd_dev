class HomeController < ApplicationController

  layout :resolve_layout

  def index
    @stylist = Stylist.top_rating.only_3
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
