class CategoryController < ApplicationController
  def new
    @categories = Bigcategory.all
    @big_new = Bigcategory.new
    @small_new = Smallcategory.new
  end

  def show
    @category = Bigcategory.all
  end

  def thread
    @categories = Smallcategory.all
  end

  def big_new
    @big_new = Bigcategory.new(big_param)
    if @big_new.save
      redirect_to "/category/new"
    end
  end

  def small_new
    @small_new = Smallcategory.new(small_param)
    if @small_new.save
      redirect_to "/category/new"
    end
  end

  private
  def big_param
    params.require(:bigcategory).permit(:name_en,:name_jp)
  end
  def small_param
    params.require(:smallcategory).permit(:name_en,:name_jp,:bigcategory_id)
  end
end