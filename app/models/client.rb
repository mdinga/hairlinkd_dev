class Client < ApplicationRecord
  rolify :role_cname => 'DefClient'

  has_secure_password

  has_many :ratings, :dependent => :destroy
  has_many :stylists, :through => :ratings
  has_and_belongs_to_many :cities
  has_and_belongs_to_many :areas
  mount_uploader :picture, PictureUploader
  has_many :personal_messages, as: :chatter, :dependent => :destroy
  has_and_belongs_to_many :styles, :join_table => "fav_styles"
  has_and_belongs_to_many :stylists, :join_table => "fav_stylists"

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  PASSWORD_FORMAT = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])/x

  validates :username,  :on => :create,
                        :presence => true,
                        :length => {:within => 3..15},
                        :uniqueness => true

  validates :email,  :on => :create,
                      :presence => true,
                      :length => {:maximum => 25},
                      :format => EMAIL_REGEX

  validates :password, :on => :create,
                        :presence => true,
                        :format => {:with => PASSWORD_FORMAT, message: "must be at least 8 characters and include a number"},
                        :confirmation => true

                        validate :is_nickname_there

  before_save do
    self.email = self.email.downcase
  end

def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  self.save!
  PasswordMailer.reset_password_client(self).deliver_now
end


  private

  def is_nickname_there
    unless nickname == ""
      errors.add(:base, "Sorry can't log you on")
    end
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Client.exists?(column => self[column])
  end


end
