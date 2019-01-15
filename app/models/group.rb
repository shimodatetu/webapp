class Group < ApplicationRecord
  has_many :posts
  belongs_to :user
  after_create_commit { ThreadBroadcastJob.perform_later self }
end
