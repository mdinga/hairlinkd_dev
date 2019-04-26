class HairstyleOffering < ApplicationRecord
  belongs_to :stylist
  belongs_to :hairstyle
  has_many :hairstyle_matches
  has_many :hairstyle_requests, :through => :hairstyle_matches

  scope :top_hairstyles, lambda {|stylist, option| where(:stylist_id => stylist, :top_style => option)}
end
