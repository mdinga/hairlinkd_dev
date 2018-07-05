class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

  def empty
  end

  
end
