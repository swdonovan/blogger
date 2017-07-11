class CommentsController < ApplicationController
  before_action :set_comment, only: []
  before_action :new_comment, only: [:create]
  def create
    @comment.article_id = params[:article_id]
    @comment.save

    redirect_to article_path(@comment.article)
  end

  private

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end

  def new_comment
    @comment = Comment.new(comment_params)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
