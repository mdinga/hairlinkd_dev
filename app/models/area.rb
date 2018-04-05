class Area < ApplicationRecord

  belongs_to :city
  has_and_belongs_to_many :clients
  has_and_belongs_to_many :stylists

end
