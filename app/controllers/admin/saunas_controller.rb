class Admin::SaunasController < ApplicationController
  def index
  end

  def new
    @sauna = Sauna.new
  end

  def create
    @sauna = Sauna.new(sauna_params)
    if @sauna.save
      redirect_to admin_sauna_path(@sauna.id)
    else
      @sauna = Sauna.new
      render :new
    end
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
