class User < ApplicationRecord
  # include Authentication
  def authenticate
    validates_presence_of :username, :password
  end
  has_secure_password
end
