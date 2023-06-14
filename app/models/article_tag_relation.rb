class ArticleTagRelation < ApplicationRecord

  belongs_to :article
  belongs_to :article_tag

  validates :article_id, presence: true
  validates :article_tag_id, presence: true


end
