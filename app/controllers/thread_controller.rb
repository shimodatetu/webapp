class ThreadController < ApplicationController
  def show
    @post =Post.new
    gon.login = logged_in?
  end
  def show_post_image
    p params[:id]
    @photo = Post.find(params[:id])
    send_data @photo.photo, :type => 'image/jpeg'
  end
end
