class SessionsController < ApplicationController
  def new; end

  def create
    user = load_user
    if user && user.authenticate(params[:password])
      if user.activated?
        log_in user
        flash[:success] = "Logged in!"
        redirect_to root_path
      else
        flash[:warning] = t("not_activated") + t("check_email")
        redirect_to root_url
      end
    else
      flash.now[:warning] = t "invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out!"
    redirect_to root_path
  end

  def load_user
    User.find_by_email params[:email]
  end
end
