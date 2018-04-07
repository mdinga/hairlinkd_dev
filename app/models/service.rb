class Service < ApplicationRecord

  has_and_belongs_to_many :stylists
  has_many :portfolios

  scope :with_category, lambda {|cat| where(:category => cat)}
end
