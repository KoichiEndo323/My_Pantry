class Public::ArticlesController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_end_user, only: %i[edit update destroy]

  def index
    if params[:keyword].present?
      tag_name = ArticleTag.find(params[:keyword]).name
      flash.now[:notice] = "『#{tag_name}』タグの検索結果"
      @articles = ArticleTag.find(params[:keyword]).articles.published.order(created_at: :desc).page(params[:page]).per(12)
    else
      @articles = Article.published.order(created_at: :desc).page(params[:page]).per(10)
    end
    @tag_list = ArticleTag.all
    @keyword = params[:keyword]
    @article_urls = @articles.map { |article| image_url(article) }
  end

  def new
    @article = Article.new
    @tag_list = ArticleTag.all
  end

  def create
    @article = Article.new(article_params)
    @article.end_user_id = current_end_user.id
    params[:article][:article_tag_ids].delete("")
    article_tag_names = params[:article][:article_tag_ids]
    input_tag_names = params[:article][:name].split(',')#1番目の引数に指定したパターンに従って文字列を分割し、分割された各部分文字列を要素とする配列を取得
    params[:article][:name].delete("")
    article_tag_names.concat(input_tag_names) #
    article_tag_names = article_tag_names.uniq #uniqで登録してあるタグとインプットして作成したタグが同じ名前なら一つにまとまる
    if @article.save
      @article.save_tag(article_tag_names)
      redirect_to articles_path, notice: '記事が作成されました。'
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
    @article_url = image_url(@article)
    @post_comment = PostComment.new
    @article_tags = @article.article_tags.pluck(:name).join(',')
    @article_detail = Article.find(params[:id])
    unless ReadCount.where(created_at: Time.zone.now.all_day).find_by(end_user_id: current_end_user.id, article_id: @article_detail.id)
      current_end_user.read_counts.create(article_id: @article_detail.id)
    end
  end

  def edit
    @article_tags = @article.article_tags.pluck(:name).join(',')
    @tag_list = ArticleTag.all
  end

  def update
    article_tags = params[:article][:article_tag_ids].split(',')
    if @article.update(article_params)
       @article.update_tags(article_tags)
      redirect_to article_path(@article.id), notice: '記事内容が変更されました。'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: '投稿記事が削除されました。'
  end


  private

  def article_params
    params.require(:article).permit(:image, :title, :body, :is_published, article_tags_ids: [])
  end

  def ensure_end_user
    @article = Article.find(params[:id])
    unless @article.end_user == current_end_user
      flash[:alert] = "他のユーザーの記事は編集・削除できません。"
      redirect_to root_path
    end
  end
end
