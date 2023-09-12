class Admin::ReviewsController < ApplicationController
  before_action :is_matching_login_admin
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

  private
    def is_matching_login_admin
      unless admin_signed_in?
        redirect_to root_path
      end
    end
end
