class User < ApplicationRecord

  has_many :stylists, :dependent => :destroy
  has_many :clients, :dependent => :destroy


end
