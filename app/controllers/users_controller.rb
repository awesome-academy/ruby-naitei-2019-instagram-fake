class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "User was successfully created. Check email to activate."
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:info] = "User was successfully updated."
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:info] = "User was successfully destroyed."
    redirect_to users_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by id: params[:id]
    return unless @user.nil?
    flash[:waring] = t "user_not_exist"
    redirect_to root_url
  end

  def user_params
    params.permit(:name, :email, :password,
      :password_confirmation)
  end
end
