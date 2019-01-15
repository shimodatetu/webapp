class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end


  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    group = Group.find_by(id: data['group_id'])
    if group
      post = Post.new(content: data['message'])
      post.group_id = group.id
      post.user_id = current_user.id
      post.save
    end
  end
end
