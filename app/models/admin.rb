class Admin < ApplicationRecord
  rolify :role_cname => 'DefAdmin'

  has_secure_password

  validate :is_nickname_there


  private

  def is_nickname_there
    unless nickname == ""
      errors.add(:base, "Sorry can't log you on")
    end
  end

end
