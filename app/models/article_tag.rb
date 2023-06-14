class ArticleTag < ApplicationRecord

  has_many :article_tag_relations, dependent: :destroy
  #article_tagsテーブルから中間テーブルを介してarticleテーブルへの関連付け
  has_many :articles, through: :article_tag_relations, dependent: :destroy

  validates :name, uniqueness: true, presence: true

end
