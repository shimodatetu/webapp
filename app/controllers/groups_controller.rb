class GroupsController < ApplicationController
  def new
    gon.current_user = current_user
    gon.category = Bigcategory.all
    gon.subcategory = Smallcategory.all
    @category = Bigcategory.all
  end
end
