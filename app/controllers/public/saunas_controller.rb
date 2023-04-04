class Public::SaunasController < ApplicationController
  def index
    @saunas = Sauna.is_active.page(params[:page]).per(10)
  end

  def show
    @sauna = Sauna.find(params[:id])
    @reviews = @sauna.reviews
  end
end
