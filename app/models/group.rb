class Group < ApplicationRecord
  has_many :posts
  belongs_to :user
  belongs_to :smallcategory
  after_create_commit { ThreadBroadcastJob.perform_later self }
end
