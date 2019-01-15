class PostsController < ApplicationController
  def index
    @posts = Post.all
    @groups = Group.all
  end
end
