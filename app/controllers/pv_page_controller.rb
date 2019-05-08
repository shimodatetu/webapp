class PvPageController < ApplicationController
  def show
    @groups = Group.all.order(seen_num: "DESC")
  end
  def show_image
    @image = User.find(params[:id])
    p @image.photo
    send_data @image.photo, :type => 'image/jpeg'
  end
end
