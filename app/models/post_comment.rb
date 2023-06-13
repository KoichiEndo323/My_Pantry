class PostComment < ApplicationRecord

  belongs_to :article
  belongs_to :end_user


  validates :comment, presence: true
end
