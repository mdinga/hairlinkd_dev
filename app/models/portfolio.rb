class Portfolio < ApplicationRecord

  belongs_to :stylist
  belongs_to :service
  mount_uploader :image, ImageUploader
end
