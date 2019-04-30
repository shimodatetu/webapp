class ProfileController < ApplicationController
  def show
    @user = User.new
  end

  def update
    if current_user.update(user_params);
      redirect_to profile_path
    else
      render :show
    end
    photo = image_params[:photo]
    image_params = {}
    if photo != nil
      image_params[:photo] = photo.read
    end
    @image = Image.new(image_params)
  end
  private
  def user_params
    params.require(:user).permit(:image)
  end
end
