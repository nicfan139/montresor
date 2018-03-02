class CommentsController < ApplicationController
  def create
    @comment = Comment.new
    @comment.user = current_user
    @comment.page = params[:user_id]
    @comment.content = params[:comment][:content]
    @comment.rating = params[:comment][:rating]
    authorize @comment
    @comment.save!

    redirect_to user_path(User.find(@comment.page))
  end
end
