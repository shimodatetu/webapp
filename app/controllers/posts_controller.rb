class PostsController < ApplicationController
  def index
    @posts = Post.all
    @groups = Group.all
  end
  def create
    p "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaz"
    if !params[:post][:image].nil? && !params[:post][:group_id].nil?
      @post = Post.new(image: params[:post][:image],group_id: params[:post][:group_id],user_id: current_user.id)
      @post.save
    end
  end
end
