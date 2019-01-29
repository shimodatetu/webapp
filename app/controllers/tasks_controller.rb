class TasksController < ApplicationController
  def lang_change_jp
    session["lang"] = "jap"
    redirect_to params[:url]
  end

  def lang_change_en
    session["lang"] = "eng"
    redirect_to params[:url]
  end
end
