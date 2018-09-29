class User < ApplicationRecord
  # include Authentication
  has_secure_password
end
