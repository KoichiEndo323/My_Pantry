class Like < ApplicationRecord

  belongs_to :article
  belongs_to :end_user


  validates :end_user_id, uniqueness:{scope: :article_id}
end
