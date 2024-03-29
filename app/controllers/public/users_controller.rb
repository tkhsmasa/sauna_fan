class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:new, :create, :edit, :update, :unsubscribe, :withdraw]
  def show
    @user = User.find(params[:id])
    @bookmarks = @user.bookmarks.page(params[:page]).per(5)
    @reviews = @user.reviews.page(params[:page]).per(5)
    # .page(params[:page]).per(10)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def unsubscribe
    @user = User.find(current_user.id)
  end

  def withdraw
    @user = User.find(current_user.id)
    if @user.update(user_deleted_params)
      flash[:notice] = "退会しました"
      # reset_session
      redirect_to root_path
    else
      render :unsubscribe
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted, :create_at, :updated_at, :user_image)
  end

  def user_deleted_params
    params.require(:user).permit(:is_deleted )
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to root_path
    end
  end

end
