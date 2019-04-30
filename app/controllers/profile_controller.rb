class ProfileController < ApplicationController
  def show
    @user = User.new
    @users = User.all
  end
  def show_image
    @image = User.find(params[:id])
    p "--------------------------------------"
    p @image.photo
    p "--------------------------------------"
    send_data @image.photo, :type => 'image/jpeg'
  end
  def update
    if current_user.update(file_name: params[:user]["photo"].original_filename,
                          photo:params[:user]["photo"].read)
      redirect_to profile_path
    else
      render :show
    end
  end
  private
  def user_params
    params.require(:user).permit(:image)
  end
  def image_params
    params.require(:user).permit(:photo)
  end
end
