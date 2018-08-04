class User < ApplicationRecord

  belongs_to :operator, polymorphic: true

  has_many :personal_messages, dependent: :destroy
  has_many :authored_conversations, class_name: "Conversation", foreign_key: "author_id"
  has_many :received_conversations, class_name: "Conversation", foreign_key: "receiver_id"

scope :all_but_admin, lambda {where.not(:operator_type => "Admin")}

end
