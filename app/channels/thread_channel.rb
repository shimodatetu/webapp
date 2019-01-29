class ThreadChannel < ApplicationCable::Channel
  def subscribed
    stream_from "thread_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def make(data)
    Group.create()
    group = Group.new()
    group.smallcategory_id = data['category']
    group.title_base = data['title_base']
    group.title_jp = data['title_jp']
    group.title_en = data['title_en']
    group.user_id = current_user.id
    p "---------------------------"
    if group.save
      post = Post.new()
      post.content_base = data['message_base']
      post.content_jap = data['message_jp']
      post.content_eng = data['message_en']
      post.group_id = group.id
      post.user_id = current_user.id
      post.save
    end
  end
end
