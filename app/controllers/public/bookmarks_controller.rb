class Public::BookmarksController < ApplicationController

  def index
    @bookmarks = current_user.bookmarks.page(params[:page]).per(10)
  end
  def create
    sauna = Sauna.find(params[:sauna_id])
    bookmark = current_user.bookmarks.new(sauna_id: sauna.id)
    bookmark.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    sauna = Sauna.find(params[:sauna_id])
    bookmark = current_user.bookmarks.find_by(sauna_id: sauna.id)
    bookmark.destroy
    redirect_back(fallback_location: root_path)
  end
end
