class Admin::CommentsController < ApplicationController
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_sauna_review_path(@comment.review.sauna_id,@comment.review_id)
  end

end
