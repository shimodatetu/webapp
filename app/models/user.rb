class User < ApplicationRecord
  has_many :posts
  has_many :groups
  has_secure_password
  mount_uploader :image, ImageUploader
end
