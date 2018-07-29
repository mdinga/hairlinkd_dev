class Request < ApplicationRecord

  belongs_to :client
  belongs_to :city
  belongs_to :service
  mount_uploader :image, ImageUploader

  #validates :city_id, :presence => true

end
