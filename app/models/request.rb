class Request < ApplicationRecord



  belongs_to :client
  belongs_to :city
  has_many :responses, :dependent => :destroy
  mount_uploader :image, ImageUploader

  #validates :city_id, :presence => true

  scope :recent_first, lambda{order("created_at DESC")}

end
