class HairstyleRequest < ApplicationRecord
  belongs_to :client
  belongs_to :hairstyle
  has_many :hairstyle_matches, :dependent => :destroy
  has_many :hairstyle_offerings, :through => :hairstyle_matches
end
