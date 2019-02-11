class PostsController < ApplicationController
  def index
    @posts = Post.all
    @groups = Group.all
  end
  def create
    if !params[:post][:image].nil? && !params[:post][:group_id].nil?
      @post = Post.new(image: params[:post][:image],group_id: params[:post][:group_id],user_id: current_user.id)
      @post.save
    end
    #respond_to do |format|
        #format.html #{ redirect_to  '/thread/index/'+params[:post][:group_id]}
        #format.json
      #end
  end
end
