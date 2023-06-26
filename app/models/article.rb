class Article < ApplicationRecord

  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :article_tag_relations, dependent: :destroy
  #articlesテーブルから中間テーブルを介してarticle_tagsテーブルへの関連付け
  has_many :article_tags, through: :article_tag_relations, dependent: :destroy
  belongs_to :end_user

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :body
    #validates :article_tag
    #validates :is_published boolean型でpresenceだと適正ではない
  end

  validates :is_published, inclusion: {in: [true, false]}

  # 公開・非公開機能
  scope :published, -> {where(is_published: true)}
  scope :unpublished, -> {where(is_published: false)}

  def liked_by?(end_user)
    likes.where(end_user_id: end_user.id).exists?
  end

  def get_article_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
      image
  end


  def save_tag(article_tag_names)
    article_tag_names.flatten.compact_blank.each do |new_tags|
      article_tag = ArticleTag.find_or_create_by(name: new_tags)
      relation = ArticleTagRelation.new(article_id: self.id, article_tag_id: article_tag.id)
      relation.save!
    end
  end

  def update_tags(latest_article_tags)
    if self.article_tags.empty?
      latest_article_tags.each do |latest_tag|
        self.article_tags.find_or_create_by(name: latest_tag)
      end
    elsif latest_article_tags.empty?
      self.article_tags.each do |tag|
        self.article_tags.delete(tag)
      end
    else
      current_article_tags = self.article_tags.pluck(:name)

      old_article_tags = current_article_tags - latest_article_tags

      new_article_tags = latest_article_tags - current_article_tags

      old_article_tags.each do |old_tag|
        tag = self.article_tags.find_by(name: old_tag)
        self.article_tags.delete(tag) if tag.present?
      end

      new_article_tags.each do |new_tag|
        self.article_tags.find_or_create_by(name: new_tag)
      end
    end
  end
end
