class PersonalMessage < ApplicationRecord

  belongs_to :chatter, polymorphic: true
  belongs_to :conversation

  validates :body, presence: true

end
