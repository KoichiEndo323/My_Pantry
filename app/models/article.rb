class Article < ApplicationRecord

  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :article_tag_relations, dependent: :destroy
  #articlesテーブルから中間テーブルを介してarticle_tagsテーブルへの関連付け
  has_many :article_tags, through: :article_tag_relations, dependent: :destroy
  belongs_to :end_user


  has_one_attached :image

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
    image.variant(resize_to_limit: [width, height], gravity: "center", crop: "125x125+0+0").processed
  end

  def save_tag(sent_tags)
    current_tags = self.article_tags.plunk(:name) unless self.article_tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags


    old_tags.each do |old|
      self.article_tags.delete.ArticleTag.find_by(name: old)
    end

    new_tags.each do |new|
      new_article_tag_relation = article.find_or_create_by(name: new)
      self.article_tags << new_article_tag_relation
    end
  end
  
end
