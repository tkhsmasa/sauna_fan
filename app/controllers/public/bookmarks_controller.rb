class Public::BookmarksController < ApplicationController
  before_action :is_matching_login_user
  def index
    @bookmarks = current_user.bookmarks.page(params[:page]).per(10)
  end
  def create
    if user_signed_in?
      sauna = Sauna.find(params[:sauna_id])
      bookmark = current_user.bookmarks.new(sauna_id: sauna.id)
      bookmark.save
      redirect_back(fallback_location: root_path)
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    if user_signed_in?
      sauna = Sauna.find(params[:sauna_id])
      bookmark = current_user.bookmarks.find_by(sauna_id: sauna.id)
      bookmark.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_to new_user_session_path
    end
  end


  private

  def is_matching_login_user
    if current_user.nil?
      redirect_to root_path
    end
    # user = User.find(params[:id])
    # unless user.id == current_user.id
    #   redirect_to root_path
    # end
  end


end
