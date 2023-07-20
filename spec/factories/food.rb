FactoryBot.define do
  factory :food do
    name { Faker::Lorem.characters(number:10) }
    quantity { Faker::Lorem.characters(number:30) }
  end
end