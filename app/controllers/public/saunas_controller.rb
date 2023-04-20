class Public::SaunasController < ApplicationController
  def index
    @search_params = sauna_search_params
    @saunas = Sauna.search(@search_params).joins(:genre).is_active.page(params[:page]).per(10)
  end


  def show
    @sauna = Sauna.find(params[:id])
    @reviews = @sauna.reviews
    @bookmarks = @sauna.bookmarks
    #byebug
  end

  private

  def sauna_search_params
    params.fetch(:search, {}).permit(:name, :address, :genre)

  end
end
