class ThreadAllController < ApplicationController
  def index
    @groups = Group.all
    @posts = Post.all
  end
end
