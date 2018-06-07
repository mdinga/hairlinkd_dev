class ContactForm < ApplicationRecord



EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

validates :name,  :on => :create,
                  :presence => true

validates :email, :on => :create,
                  :presence => true,
                  :length => {:maximum => 50},
                  :format => EMAIL_REGEX

validates :message, :on => :create,
                    :presence => true

end
