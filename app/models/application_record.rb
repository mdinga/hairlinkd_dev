class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

  def create_user
    @user = User.new
    self.user == @user
    @user.save!
  end



end
