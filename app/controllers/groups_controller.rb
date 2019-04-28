class GroupsController < ApplicationController
  def new
    gon.current_user = current_user
    gon.category = Bigcategory.all
    gon.subcategory = Smallcategory.all
    gon.google_key = ENV['GOOGLE_KEY']
    @category = Bigcategory.all
  end
end
