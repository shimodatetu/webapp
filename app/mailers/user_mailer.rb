class UserMailer < ApplicationMailer
    def account_activation(user)
      @user = user
      mail to: user.email, subject: "Account activation / 会員登録の完了"
    end

    def password_reset(user)
      @user = user
      mail to: user.email, subject: "Password reset / パスワード変更"
    end
end
