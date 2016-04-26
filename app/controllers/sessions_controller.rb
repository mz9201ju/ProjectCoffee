class SessionsController < ApplicationController
  # user shouldn't have to be logged in before logging in!
  skip_before_filter :set_current_user
  def create
    auth=request.env["omniauth.auth"]
    user=Coffeeuser.find_by_provider_and_uid(auth["provider"],auth["uid"]) ||
      Coffeeuser.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_path
  end
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logged out successfully.'
    redirect_to root_path
  end
end