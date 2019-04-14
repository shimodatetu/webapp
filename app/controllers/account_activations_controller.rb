class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])

      p "----------------------1--------------------"
      user.update_attribute(:activated,    true)

      p "----------------------2--------------------"
      user.update_attribute(:activated_at, Time.zone.now)
      p "----------------------3--------------------"
      log_in user
      p "----------------------4--------------------"
      flash[:success] = "Account activated!"
      redirect_to root_url
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
  private
  def log_in(user)
    session[:user_id] = user.id
  end
end
