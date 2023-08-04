class ReadCount < ApplicationRecord
  belongs_to :end_user
  belongs_to :article
end
