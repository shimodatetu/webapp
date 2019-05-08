class CategoryController < ApplicationController
  def new
    @categories = Bigcategory.all
    @big_new = Bigcategory.new
    @small_new = Smallcategory.new
  end
  def new2
    @categories = Bigcategory.all
    @big_new = Bigcategory.new
    @small_new = Smallcategory.new
  end
  def all_new
    big_ary_en = []
    small_ary_en = []
    small_piece = []
    first = true
    params[:category_en].split("\r\n").each do |en_cate|
      if en_cate.include?('@')
        big_ary_en.push(en_cate.sub(/@/,''))
        if first == true
          first = false
        else
          small_ary_en.push(small_piece)
        end
        small_piece = []
      else
        small_piece.push(en_cate)
      end
    end
    small_ary_en.push(small_piece)
    big_id = -1
    big_real_id = 0
    small_id = 0
    params[:category_jp].split("\r\n").each do |jp_cate|
      if jp_cate.include?('¥')
        return
      elsif jp_cate.include?('＠')
        big_id+=1
        bigcategory = Bigcategory.new()
        bigcategory.name_en = big_ary_en[big_id]
        bigcategory.name_jp = jp_cate.sub(/＠/,'')
        bigcategory.save
        big_real_id = bigcategory.id
        small_id = 0
      else
        smallcategory = Smallcategory.new()
        smallcategory.name_en = small_ary_en[big_id][small_id]
        smallcategory.name_jp = jp_cate
        smallcategory.bigcategory_id = big_real_id
        small_id += 1
        if smallcategory.save
        else
          p small_id.to_s + "/" + big_real_id.to_s + "/" + smallcategory.name_en + "/" + smallcategory.name_jp
        end
      end
    end

  end

  def show
    @category = Bigcategory.all
  end

  def smallcategory
    @categories = Smallcategory.all
    @test_id = params[:id]
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
