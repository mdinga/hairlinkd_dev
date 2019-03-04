class HomeController < ApplicationController

  layout :resolve_layout

  def index
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
