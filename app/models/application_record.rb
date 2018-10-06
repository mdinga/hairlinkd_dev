class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

  def downcase_email
    self.email = self.email.downcase
  end

  def create_user
    @user = User.new
    self.user == @user
    @user.save!
  end

  def capitalize_username
    self.username = self.username.capitalize
  end



end
