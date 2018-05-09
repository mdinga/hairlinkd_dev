class Admin < ApplicationRecord
  rolify :role_cname => 'DefAdmin'

  has_secure_password
  
end
