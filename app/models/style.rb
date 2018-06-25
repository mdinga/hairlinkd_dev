class Style < ApplicationRecord

  mount_uploader :image, ImageUploader
  has_and_belongs_to_many :clients, :join_table => "fav_styles"
  belongs_to :service


end
