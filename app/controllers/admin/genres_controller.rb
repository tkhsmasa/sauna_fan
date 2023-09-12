class Admin::GenresController < ApplicationController
  before_action :is_matching_login_admin
  def index
    # ジャンル新規
    @genre_new = Genre.new
    # ジャンル一覧取得
    @genres = Genre.page(params[:page]).per(10)
  end

  def create
    @genre_new = Genre.new(genre_params)
    if @genre_new.save
      redirect_to admin_genres_path
    else
      @genre_new = Genre.new
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to admin_genres_path
    else
      redirect_to admin_genres_path
      # render :index
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end



  private
    def genre_params
      params.require(:genre).permit(:name)
    end

    def is_matching_login_admin
      unless admin_signed_in?
        redirect_to root_path
      end
    end
end
