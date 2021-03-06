class SessionsController < ApplicationController
  def index
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password]) && user.activated?
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:failed_en] = "Mail address or password is wrong."
      flash.now[:failed_jp] = "メールアドレスかパスワードが間違っています。"
      render :index
    end
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

end
