class ThreadController < ApplicationController
  def show
    @post =Post.new
  end
end
