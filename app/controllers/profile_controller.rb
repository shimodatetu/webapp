class ProfileController < ApplicationController
  def show
  end

  def update

    if current_user.update(user_params);
    #if current_user.update(image: params[:user][:image]);
      flash.now[:success] = "登録に成功しました"
      redirect_to profile_path
    else
      flash.now[:danger] = "登録に失敗しました"
      render :show
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :country, :age, :gender, :fullName, :profile, :email, :image)
  end
end
