class MessageBroadcastJob < ApplicationJob
  queue_as :default
  def perform(message)
    # ActionCable.server.broadcast_to(render_message(message))
    if message.image.blank?
      ActionCable.server.broadcast 'room_channel', message: render_message(message)
    else
      ActionCable.server.broadcast 'room_channel', message: "<img src='#{message.image.url}'>"
    end
  end
  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'posts/post', locals: { post: message })
  end

end
