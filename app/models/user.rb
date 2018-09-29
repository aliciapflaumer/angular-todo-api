class User < ApplicationRecord
  has_many :tasks

  # include Authentication
  has_secure_password
end
