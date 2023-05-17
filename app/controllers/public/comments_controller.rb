class Public::CommentsController < ApplicationController
  before_action :is_matching_login_user
  def new
    @review = Review.find(params[:review_id])
    @sauna = Sauna.find(params[:sauna_id])
    @comment = Comment.new
  end

  def create
    @review = Review.find(params[:review_id])
    @comment = current_user.comments.new(comment_params)
    @comment.review_id = @review.id
    if @comment.save
      flash[:notice] = "You have created comment successfully."
      redirect_to sauna_review_path(@comment.review.sauna,@comment.review)
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @review = @comment.review
    @sauna = @review.sauna
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "You have created comment successfully."
      redirect_to sauna_review_comment_path
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to sauna_review_path(@comment.review.sauna_id,@comment.review_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :review_id, :comment_detail)
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
