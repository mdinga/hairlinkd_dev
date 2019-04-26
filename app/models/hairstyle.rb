class Hairstyle < ApplicationRecord
  has_many :hairstyle_offerings
  has_many :stylists, :through => :hairstyle_offerings
  has_many :hairstyle_requests
  has_many :clients, :through => :hairstyle_requests


  #scope :with_category, -> (cat) {joins(:hairstyle_category).where("hairstyle_category.name LIKE ?", "#{cat}")}
  scope :with_category, lambda{|cat| where(:category => cat)}

end
