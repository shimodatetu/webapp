class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:success] = "登録に成功しました"
      RegisterMailer.send_confirm_mail(@user).deliver_now

      redirect_to root_path
    else
      flash.now[:danger] = "登録に失敗しました"
      render :index
    end
  end
  def update

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
