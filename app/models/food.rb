class Food < ApplicationRecord

  has_many :notifications, dependent: :destroy
  belongs_to :storage, optional: true
  belongs_to :end_user, optional: true
  #optional: trueは関連するオブジェクトが存在しなくても、関連元のオブジェクトを保存することができる

  has_one_attached :image

  enum status: { within_the_expiration_date: 0, expiration_date_expired: 1 }

  with_options presence: true do
    validates :image
    validates :name
    validates :start_date
    validates :end_date
  end

  def get_food_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'no_image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end




end
