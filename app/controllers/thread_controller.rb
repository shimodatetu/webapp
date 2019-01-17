class ThreadController < ApplicationController
  def index
    @groups = Group.all
    @posts = Post.all
    @post = Post.new
  end
end
