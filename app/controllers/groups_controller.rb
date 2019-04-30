class GroupsController < ApplicationController
  def new
    @category = Bigcategory.all
  end
end
