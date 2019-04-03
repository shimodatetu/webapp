class SearchController < ApplicationController
  def show
    @groups = Group.all
  end
end
