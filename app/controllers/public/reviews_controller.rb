class Public::ReviewsController < ApplicationController
  before_action :is_matching_login_user, only: [:new, :create, :edit, :update, :destroy]
  def new
    @review = Review.new
  end

  def create
    @sauna = Sauna.find(params[:sauna_id])
    @review = current_user.reviews.new(review_params)
    @review.sauna_id = @sauna.id
    if @review.save
      flash[:notice] = "You have created review successfully."
      redirect_to sauna_review_path(@sauna,@review)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    @comments = @review.comments.page(params[:page]).per(10)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "You have created review successfully."
      redirect_to sauna_review_path
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to sauna_path(@review.sauna_id)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :sauna_id, :review_title, :review_detail, :rate, :visit_date)
  end

  def is_matching_login_user
    if current_user.nil?
      redirect_to root_path
    end

    # user = User.find(params[:id])
    # unless user.id == current_user.id
    #   redirect_to root_path
    # end
  end

end
