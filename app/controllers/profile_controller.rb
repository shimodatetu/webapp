class ProfileController < ApplicationController
  def show
    @user = User.new
    gon.google_key = ENV['GOOGLE_KEY']
  end

  def update
    if current_user.update(user_params);
      redirect_to profile_path
    else
      render :show
    end
  end
  private
  def user_params
    params.require(:user).permit(:image)
  end
end
