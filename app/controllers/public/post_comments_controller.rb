class Public::PostCommentsController < ApplicationController

  def create
    article = Article.find(params[:article_id])
    @comment = current_end_user.post_comments.new(post_comment_params)
    @comment.article_id = article.id
    @comment.save
  end

  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
  end

  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
