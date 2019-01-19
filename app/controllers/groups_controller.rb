class GroupsController < ApplicationController
  def new
  end

  def create
    @group = Group.new(group_param)
    @group.user_id = current_user.id
    if @group.save
      @post = Post.new(post_param)
      @post.user_id = current_user.id
      @post.group_id = @group.id
      if @post.save
        redirect_to "/thread/show/#{@group.id}",success: "コメントに成功しました。"
      else
        flash.now[:danger] = "コメントに失敗しました。"
        render :new
      end
    else
      flash.now[:danger] = "コメントに失敗しました。"
      render :new
    end
  end

  private
  def group_param
    params.permit(:title)
  end
  def post_param
    params.permit(:content)
  end
end
