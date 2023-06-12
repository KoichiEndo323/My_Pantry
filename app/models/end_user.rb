class EndUser < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :menus, dependent: :destroy

  has_one_attached :profile_image

  def get_profile_image(weight, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/user_1.png')
      profile_image.attach(io: File.open(file_path), filename: 'user_1.png', content_type: 'image/png')
    end
    profile_image.variant(resize_to_limit: [weight, height]).processed
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |end_user|
    end_user.password = SecureRandom.urlsafe_base64
    end
  end
end
