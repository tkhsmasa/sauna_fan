class Admin::CommentsController < ApplicationController
  before_action :is_matching_login_admin
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_sauna_review_path(@comment.review.sauna_id,@comment.review_id)
  end

  private

  def is_matching_login_admin
    unless admin_signed_in?
      redirect_to root_path
    end
  end

end
