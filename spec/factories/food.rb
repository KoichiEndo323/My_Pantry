FactoryBot.define do
  factory :food do
    # その他の属性を設定
    name { 'hoge' }
    quantity { 10 }
    start_date { Time.now }
    end_date { Time.now + 1.day }

    association :end_user

    # 画像のアタッチ
    after(:build) do |food|
      food.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'images', 'sample.jpg')), filename: 'sample.jpg', content_type: 'image/jpeg')
    end
  end
end
