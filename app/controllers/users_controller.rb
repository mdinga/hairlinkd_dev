class UsersController < ApplicationController

  layout "application"


  def index
    @user = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new

    if @user.save
      flash[:notice] = "User created successfully"
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private

end
