class Portfolio < ApplicationRecord

  belongs_to :stylist
  mount_uploader :image, ImageUploader
end
