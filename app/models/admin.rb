class Admin < ApplicationRecord
  rolify :role_cname => 'DefAdmin'

  has_secure_password

  has_one :user, as: :operator, :dependent => :destroy

  validate :is_nickname_there


  # call backs

  before_save :downcase_email
  after_update :create_user
  
  private

  def is_nickname_there
    unless nickname == ""
      errors.add(:base, "Sorry can't log you on")
    end
  end

end
