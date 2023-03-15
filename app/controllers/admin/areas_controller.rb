class Admin::AreasController < ApplicationController
  def index
    #ジャンル新規
    @area_new = Area.new
    #ジャンル一覧取得
    @areas = Area.page(params[:page]).per(10)
  end

  def create
   @area_new = Area.new(area_params)
    if @area_new.save
      redirect_to admin_areas_path
    else
      @area_new = Area.new
      render :index
    end
  end

  def edit
    @area = Area.find(params[:id])
  end

  def update
    @area = Area.find(params[:id])
    if @area.update(area_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to admin_areas_path
    else
      redirect_to admin_areas_path
      # render :index
    end
  end

  def destroy
    @area = Area.find(params[:id])
    @area.destroy
    redirect_to admin_areas_path
  end



  private

  def area_params
    params.require(:area).permit(:name)
  end

end
