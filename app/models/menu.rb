class Menu < ApplicationRecord

  belongs_to :end_user

  has_one_attached :image

    with_options presence: true do
    validates :image
    validates :title
    validates :meal_time
  end

  def get_menu_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'no_image/jpeg')
    end
    image
  end

end
