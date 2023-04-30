class Admin::ReviewsController < ApplicationController
  def index
    # @sauna = Sauna.find(params[:sauna_id])
    @reviews = Review.page(params[:page]).per(20)
  end

  def show
    @review = Review.find(params[:id])
    @comments = @review.comments.page(params[:page]).per(10)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_sauna_path(@review.sauna_id)
  end
end
