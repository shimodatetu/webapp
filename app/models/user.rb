class User < ApplicationRecord
  has_many :posts
  has_many :groups

  has_secure_password
end
