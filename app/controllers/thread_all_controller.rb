class ThreadAllController < ApplicationController
  def show
    @groups = Group.all
    @posts = Post.all
  end
end
