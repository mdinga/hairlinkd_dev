class HairstyleCategory < ApplicationRecord
  has_many :hairstyles, :dependent => :destroy

  scope :alphabetical, lambda{order("name ASC")}
end
