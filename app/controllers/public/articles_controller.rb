class Public::ArticlesController < ApplicationController

  def index
    @articles = Article.published.page(params[:page]).per(10)
    @article = Article.new

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.end_user_id = current_end_user.id
    if @article.save
      redirect_to articles_path, notice: '記事が投稿されました。'
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path, notice: '記事内容が変更されました。'
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: '投稿記事が削除されました。'
  end


  private

  def article_params
    params.require(:article).permit(:image, :title, :body, :is_published)
  end
end
