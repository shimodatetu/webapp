class RegisterMailer < ApplicationMailer
  default from: "shimoda14@mccc.jp"

  def send_confirm_mail(user)
    @user = user
    mail(
      subject: "会員登録が・・・",
      to: @user.email
    )
  end
end
