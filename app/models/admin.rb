class Admin < ApplicationRecord
  rolify :role_cname => 'DefAdmin'

  has_secure_password

  validate :is_nickname_there

  before_save do
    self.email = self.email.downcase
  end

  private

  def is_nickname_there
    unless nickname == ""
      errors.add(:base, "Sorry can't log you on")
    end
  end

end
