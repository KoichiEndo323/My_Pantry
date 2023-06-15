class Public::ArticlesController < ApplicationController

  def index
    @articles = Article.published.page(params[:page]).per(10)
    @article = Article.new
    @tag_list = ArticleTag.all
  end

  def new
    @article = Article.new
    @tag_list = ArticleTag.all
  end

  def create
    @article = Article.new(article_params)
    @article.end_user_id = current_end_user.id
    article_tags = params[:article][:name].split(',') #1番目の引数に指定したパターンに従って文字列を分割し、分割された各部分文字列を要素とする配列を取得

    if @article.save
      @article.save_tag(article_tags)
      redirect_to articles_path, notice: '記事が投稿されました。'
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    @post_comment = PostComment.new
    @article_tags = @article.article_tags.pluck(:name).join(',')
  end

  def edit
    @article = Article.find(params[:id])
    @article_tags = @article.article_tags.pluck(:name).join(',')
    @tag_list = ArticleTag.all
  end

  def update
    @article = Article.find(params[:id])
    article_tags = params[:article][:name].split(',')
    if @article.update(article_params)
       @article.update_tags(article_tags)
      redirect_to article_path(@article.id), notice: '記事内容が変更されました。'
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
    params.require(:article).permit(:image, :title, :body, :is_published, article_tags_ids: [])
  end
end
