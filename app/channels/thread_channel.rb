class ThreadChannel < ApplicationCable::Channel
  def subscribed
    stream_from "thread_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def make(data)
    Group.create()
    group = Group.create(title: data['title'], user_id: current_user.id)
    post = Post.new(content: data['message'])
    post.group_id = group.id
    post.user_id = current_user.id
    post.save
  end
end
