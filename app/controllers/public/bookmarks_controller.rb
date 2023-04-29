class Public::BookmarksController < ApplicationController

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
end
