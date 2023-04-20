class Public::HomesController < ApplicationController
  def top
    @search_params = sauna_search_params
    @saunas = Sauna.search(@search_params).joins(:genre).is_active.page(params[:page]).per(6)
    @saunas_new = @saunas.order(created_at: :desc)
  end

  private

  def sauna_search_params
    params.fetch(:search, {}).permit(:name, :address, :genre)

  end

end
