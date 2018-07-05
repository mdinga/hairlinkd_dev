class Stylist < ApplicationRecord
  rolify :role_cname => 'DefStylist'


  has_secure_password

  has_many :ratings
  has_many :clients, :through => :ratings
  has_many :portfolios
  has_and_belongs_to_many :hairstyles
  has_and_belongs_to_many :services
  has_and_belongs_to_many :clients, :join_table => "fav_stylists"
  has_and_belongs_to_many :cities
  has_and_belongs_to_many :areas
  mount_uploader :avatar, AvatarUploader

  scope :top_rating, lambda {order("overall_rating DESC")}
  #scope :sort, lambda {order("#{params[:sort_param]} DES")}
  scope :only_3, lambda {limit(3)}
  scope :review, lambda {order ("ratings.count DESC")}

  #scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}


    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
    PASSWORD_FORMAT = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])/x

  validates :username,  :on => :create,
                        :presence => true,
                        :length => {:within => 3..15},
                        :uniqueness => true

  validates :email,     :on => :create,
                        :presence => true,
                        :length => {:maximum => 50},
                        :format => EMAIL_REGEX

  validates :password,  :on => :create,
                        :presence => true,
                        :format => {:with => PASSWORD_FORMAT, message: "must be at least 8 characters and include a number"},
                        :confirmation => true

  validate :is_nickname_there

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Stylist.exist?(column => self[column])
  end

  def send_password_reset
    generate_token[:password_reset_token]
    self.password_reset_at = Time.zone.now
    save!
    PasswordMailer.reset_password(self).deliver_now
  end

  def self.search(search)
    if search
      where("name LIKE ?", "%#{search}%")
    else
      all
    end
  end

  def self.find_city(place)
    if place
      self.joins(:cities).where("cities.city = ?", place)
    else
      all
    end
  end

  def self.find_area(sub_place)
    if sub_place
      self.joins(:areas).where("areas.name = ?", sub_place)
    else
      all
    end
  end


  private

  def is_nickname_there
    unless nickname == ""
      errors.add(:base, "Sorry can't log you on")
    end
  end


end
