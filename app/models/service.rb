class Service < ApplicationRecord

  has_and_belongs_to_many :stylists
  has_many :portfolios
end
