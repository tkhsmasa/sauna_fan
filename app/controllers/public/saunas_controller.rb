class Public::SaunasController < ApplicationController
  def index
  end

  def show
    @sauna = Sauna.find(params[:id])
    @reviews = @sauna.reviews
  end
end
