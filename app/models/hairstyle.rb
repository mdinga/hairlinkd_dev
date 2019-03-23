class Hairstyle < ApplicationRecord
  belongs_to :hairstyle_category
  has_and_belongs_to_many :stylists

end
