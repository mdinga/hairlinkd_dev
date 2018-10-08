class Stylist < ApplicationRecord
  rolify :role_cname => 'DefStylist'


  has_secure_password

  has_one :user, as: :operator, :dependent => :destroy
  has_many :ratings, :dependent => :destroy
  has_many :clients, :through => :ratings
  has_many :portfolios, :dependent => :destroy
  has_many :responses, :dependent => :destroy
  has_and_belongs_to_many :hairstyles
  has_and_belongs_to_many :services
  has_and_belongs_to_many :cities
  has_and_belongs_to_many :areas
  mount_uploader :avatar, AvatarUploader
  has_and_belongs_to_many :clients, :join_table => "fav_stylists"

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


# Call backs
  before_save :downcase_email
  before_save :capitalize_username
  after_create :create_user

# General funtions
def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  self.save!
  PasswordMailer.reset_password_stylist(self).deliver_now
end

  def self.search(search)
    if search
      where("username LIKE ?", "%#{search}%")
    else
      where(nil)
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

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Stylist.exists?(column => self[column])
  end

  def is_nickname_there
    unless nickname == ""
      errors.add(:base, "Sorry can't log you on")
    end
  end


end
