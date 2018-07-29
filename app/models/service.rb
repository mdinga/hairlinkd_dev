class Service < ApplicationRecord

  has_and_belongs_to_many :stylists
  has_many :portfolios
  has_many :styles
  has_many :requests

  scope :with_category, lambda {|cat| where(:category => cat)}
  scope :alphabetically, lambda {order("name ASC")}
end
