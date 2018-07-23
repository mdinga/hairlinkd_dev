class Conversation < ApplicationRecord

  has_many :personal_messages, :dependent => :destroy
  belongs_to :stylist
  belongs_to :client

  scope  :participating_as_stylist, lambda {|user| where(("consersations.stylist_id = ?"), user.id)}
  scope  :participating_as_client, lambda {|user| where(("consersations.client_id = ?"), user.id)}
end
