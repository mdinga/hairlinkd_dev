class UsersController < ApplicationController

  def index
    @users = User.all_but_admin
  end

end
