class Food < ApplicationRecord

  has_many :notifications, dependent: :destroy
  belongs_to :storage, optional: true
  belongs_to :end_user
  #optional: trueは関連するオブジェクトが存在しなくても、関連元のオブジェクトを保存することができる

  has_one_attached :image

  enum status: { within_the_expiration_date: 0, expiration_date_expired: 1 }

  with_options presence: true do
    validates :image
    validates :name
    validates :quantity, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :start_date
    validates :end_date
  end

  def get_food_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'no_image/jpeg')
    end
    image
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "end_date", "end_user_id", "id", "memo", "name", "quantity", "start_date", "status", "updated_at"]
  end



end
