class Admin::SaunasController < ApplicationController
  def index
  end

  def new
    @sauna = Sauna.new
  end

  def show
  end

  def edit
  end


  private

  def sauna_params
    params.require(:sauna).permit(:sauna_image, :genre_id, :area_id, :name, :introduction, :price, :business_hours, :is_active)
  end

end
