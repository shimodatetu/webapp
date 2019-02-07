class TasksController < ApplicationController
  def lang_change_jp
    session["lang"] = "jap"
    redirect_to params[:url]
  end

  def lang_change_en
    session["lang"] = "eng"
    redirect_to params[:url]
  end

  def search
    text = params[:search_text]
    if !text.empty?
      flash["search"] = "true"
      if text.length == text.bytesize
        big_search = Bigcategory.where("name_en LIKE ?", "%"+ text +"%")[0];
        if !big_search.nil?
          flash["search_big_en"] = big_search.name_en
          flash["search_big_jp"] = big_search.name_jp
          flash["search_big_id"] = big_search.id
        else
          sub_search = Smallcategory.where("name_en LIKE ?", "%"+ text +"%")[0];
          if !sub_search.nil?
            flash["search_sub_en"] = sub_search.name_en
            flash["search_sub_jp"] = sub_search.name_jp
            flash["search_sub_id"] = sub_search.id
            
            flash["search_big_en"] = sub_search.bigcategory.name_en
            flash["search_big_jp"] = sub_search.bigcategory.name_jp
            flash["search_big_id"] = sub_search.bigcategory.id
          end
        end
      else
        big_search = Bigcategory.where("name_jp LIKE ?", "%"+ text +"%")[0];
        if !big_search.nil?
          flash["search_big_en"] = big_search.name_en
          flash["search_big_jp"] = big_search.name_jp
          flash["search_big_id"] = big_search.id
        else
          sub_search = Smallcategory.where("name_jp LIKE ?", "%"+ text +"%")[0];
          if !sub_search.nil?
            flash["search_sub_en"] = sub_search.name_en
            flash["search_sub_jp"] = sub_search.name_jp
            flash["search_sub_id"] = sub_search.id

            flash["search_big_en"] = sub_search.bigcategory.name_en
            flash["search_big_jp"] = sub_search.bigcategory.name_jp
            flash["search_big_id"] = sub_search.bigcategory.id
          end
        end
      end
      redirect_to "/category/show"
    end
  end
end
