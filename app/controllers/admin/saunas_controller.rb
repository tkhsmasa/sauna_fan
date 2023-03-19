class Admin::SaunasController < ApplicationController
  def index
    @saunas = Sauna.page(params[:page]).per(10)
  end

  def new
    @sauna = Sauna.new
  end

  def create
    @sauna = Sauna.new(sauna_params)
    if @sauna.save
      flash[:notice] = "You have created book successfully."
      redirect_to admin_sauna_path(@sauna.id)
    else

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
