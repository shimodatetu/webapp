class User < ApplicationRecord
  has_many :posts
  has_many :groups

  after_update_commit { ProfileBroadcastJob.perform_later self }
  has_secure_password

  mount_uploader :image, ImageUploader
end
