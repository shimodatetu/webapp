class SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user.activated? && user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :index
    end
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

end
