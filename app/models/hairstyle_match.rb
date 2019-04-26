class HairstyleMatch < ApplicationRecord
  belongs_to :hairstyle_request
  belongs_to :hairstyle_offering
end
