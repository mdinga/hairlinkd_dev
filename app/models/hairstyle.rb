class Hairstyle < ApplicationRecord
  belongs_to :hairstyle_categories
  has_and_belongs_to_many :stylists

end
