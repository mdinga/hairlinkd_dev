class User < ApplicationRecord

  belongs_to :operator, polymorphic: true

end
