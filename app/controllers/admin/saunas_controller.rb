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
    @bookmarks = @sauna.bookmarks
  end

  def edit
    @sauna = Sauna.find(params[:id])
  end

  def update
    @sauna = Sauna.find(params[:id])

    if params[:sauna][:image_ids]
      params[:sauna][:image_ids].each do |image_id|
        image = @sauna.sauna_images.find(image_id)
        image.purge
      end
    end

    if @sauna.update(sauna_params)
      flash[:notice] = "You have updated sauna successfully."
      redirect_to admin_sauna_path
    else
      render :edit
    end
  end


  private

  def sauna_params
    params.require(:sauna).permit( :genre_id, :name, :postal_code, :address1, :address2, :address3, :address_full, :introduction, :price, :business_hours, :is_active, :sales_state, :latitude, :longitude, sauna_images: [] )
  end

end
