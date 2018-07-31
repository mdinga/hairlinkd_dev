class Response < ApplicationRecord

  belongs_to :stylist
  belongs_to :response

  validates :message, :presence => true

end
