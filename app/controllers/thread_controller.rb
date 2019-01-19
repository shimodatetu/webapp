class ThreadController < ApplicationController
  def show
    @groups = Group.all
    @posts = Post.all
    @post = Post.new
  end
end
