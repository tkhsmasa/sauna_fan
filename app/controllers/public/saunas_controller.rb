class Public::SaunasController < ApplicationController
  def index
  end

  def show
    @sauna = Sauna.find(params[:id])
  end
end
