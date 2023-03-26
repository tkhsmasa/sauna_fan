class Public::BookmarksController < ApplicationController

  def create
    sauna = Sauna.find(params[:sauna_id])
    bookmark = current_user.bookmarks.new(sauna_id: sauna.id)
    bookmark.save
    redirect_to sauna_path(sauna)
  end

  def destroy
    sauna = Sauna.find(params[:sauna_id])
    bookmark = current_user.bookmarks.find_by(sauna_id: sauna.id)
    bookmark.destroy
    redirect_to sauna_path(sauna)
  end
end
