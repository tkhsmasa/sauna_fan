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
      flash[:notice] = "You have created sauna successfully."
      redirect_to admin_sauna_path(@sauna.id)
    else
      render :new
    end
  end

  def show
    @sauna = Sauna.find(params[:id])
    @reviews = @sauna.reviews
  end

  def edit
    @sauna = Sauna.find(params[:id])
  end

  def update
    @sauna = Sauna.find(params[:id])
    if @sauna.update(sauna_params)
      flash[:notice] = "You have updated sauna successfully."
      redirect_to admin_sauna_path
    else
      render :edit
    end
  end


  private

  def sauna_params
    params.require(:sauna).permit(:sauna_image, :genre_id, :area_id, :name, :postal_code, :address, :introduction, :price, :business_hours, :is_active)
  end

end
