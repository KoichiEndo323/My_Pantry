class EndUser < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, through: :likes, source: :article
  has_many :notifications, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :menus, dependent: :destroy

  has_one_attached :profile_image

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  def get_profile_image(weight, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/user_1.png')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/*')
    end
    profile_image.variant(resize_to_limit: [weight, height]).processed
  end

  #ゲストログイン機能
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |end_user|
    end_user.password = SecureRandom.urlsafe_base64
    end_user.nickname = 'ゲストユーザー'
    end
  end

  def guest?
    email == 'guest@example.com'
  end

  #ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないようにする
  def active_for_authentication?
    super && (is_deleted == false)
  end

end
