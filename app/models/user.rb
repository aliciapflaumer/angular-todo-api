class User < ApplicationRecord
  # include Authentication
  # has_secure_password
  has_many :tasks
end
