class PostsController < ApplicationController
  def index
    @posts = Post.all
    @groups = Group.all
  end
  def create
    @post = Post.new(image: params.require(:file),group_id: params[:post][:group_id],user_id: current_user.id)
    @post.save
    # respond_to do |format|
    #    format.html #{ redirect_to  '/thread/index/'+params[:post][:group_id]}
    #    format.json
    #  end
  end
end
