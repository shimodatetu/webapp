class PvPageController < ApplicationController
  def show
    @groups = Group.all.order(seen_num: "DESC")
  end
end
