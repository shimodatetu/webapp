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
    p "-----------------------------------------------"
    p "-----------------------------------------------"
    p "-----------------------------------------------"
    session["search_text"] = params[:search_text]
    redirect_to "/search/show"
  end
end
