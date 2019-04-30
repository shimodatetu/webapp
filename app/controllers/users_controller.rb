class UsersController < ApplicationController
  def index
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:success] = "メールに届いたURLをクリックして、アカウントを有効かしてください。"
      UserMailer.account_activation(@user).deliver_now
      #RegisterMailer.send_confirm_mail(@user).deliver_now
      redirect_to '/account_activations/check'
    else
      flash.now[:failed_jp] = "登録に失敗しました"
      if @user.errors.any?
        @user.errors.full_messages.each do |message|
          flash.now[:failed_en] = message
          error_jp(message)
          p message
        end
      end
      p "---------------------------------------"
      render :index
    end
  end

  def error_jp(mes_en)
    if mes_en == "Password can't be blank"
      flash.now[:failed_jp] = "パスワードが空になっています。"
    elsif mes_en == "Email can't be blank"
      flash.now[:failed_jp] = "メールアドレスが空になっています。"
    elsif mes_en == "Email has already been taken"
      flash.now[:failed_jp] = "すでに登録済みのメールアドレスです。"
    elsif mes_en == "Name can't be blank"
      flash.now[:failed_jp] = "名前が空になっています。"
    elsif mes_en == "Password confirmation doesn't match Password"
      flash.now[:failed_jp] = "パスワード確認がパスワードと一致しません。"
    end
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
