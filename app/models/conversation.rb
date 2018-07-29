class Conversation < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :receiver class_name: "User"
  has_many :personal_messages, -> {order(created_at: :asc)}, dependent: :destroy

  scope :participating, lambda{|user|, where("(conversation.author.id = ? OR conversation.receiver.id = ?)", user.id, user.id)}

  validates :author, uniqueness: {scope: :reciever}

  def with(current_user)
    author == current_user.user ? reciever : author
  end

end
