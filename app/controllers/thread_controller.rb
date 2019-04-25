class ThreadController < ApplicationController
  def show
    @post =Post.new
    gon.login = logged_in?
  end
end
