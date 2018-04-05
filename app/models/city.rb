class City < ApplicationRecord

  has_and_belongs_to_many :clients
  has_and_belongs_to_many :stylists
  has_many :areas
end
