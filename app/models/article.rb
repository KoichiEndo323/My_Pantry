class Article < ApplicationRecord

  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :article_tag_relations, dependent: :destroy
  #articlesテーブルから中間テーブルを介してarticle_tagsテーブルへの関連付け
  has_many :article_tags, through: :article_tag_relations, dependent: :destroy
  belongs_to :end_user
  
  
  has_one_attached :image
  
end
