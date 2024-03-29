class Admin::UsersController < ApplicationController
  before_action :is_matching_login_admin
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to admin_user_path
    else
      render :edit
    end
  end

private
  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted)
  end

  def is_matching_login_admin
    unless admin_signed_in?
      redirect_to root_path
    end
  end
end
