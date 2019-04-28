class ThreadController < ApplicationController
  def show
    @post =Post.new
    gon.login = logged_in?
    gon.google_key = ENV['GOOGLE_KEY']
  end
end
