class Public::SaunasController < ApplicationController
  def index
    @saunas = Sauna.page(params[:page]).per(10)
  end

  def show
    @sauna = Sauna.find(params[:id])
    @reviews = @sauna.reviews
  end
end
