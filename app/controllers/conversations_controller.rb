class ConversationsController < ApplicationController

  def new
    #when starting a new conversation
    @receiver = User.find_by(params[:receiver_id])
    @author = User.find_by(params[:author_id])
    @stylist = Stylist.find_by(params[:stylist_id])
    @personal_message = current_user.user.personal_messages.build
  end

  def create

  end


private
  def who_is_user

  end

end
