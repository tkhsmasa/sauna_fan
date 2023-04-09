class Public::HomesController < ApplicationController
  def top
    @search_params = sauna_search_params
  end

  private

  def sauna_search_params
    params.fetch(:search, {}).permit(:name, :address, :genre)

  end

end
