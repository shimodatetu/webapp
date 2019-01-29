class GroupsController < ApplicationController
  def new
    gon.current_user = current_user
    gon.category = Bigcategory.all
    gon.subcategory = Smallcategory.all
    gon.lang = session["lang"]
    @category = Bigcategory.all
  end
end
