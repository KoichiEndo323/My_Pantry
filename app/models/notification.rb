class Notification < ApplicationRecord

  belongs_to :food
  belongs_to :end_user

end
