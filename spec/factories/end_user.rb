FactoryBot.define do
  factory :end_user do
    email { Faker::Internet.email }
    password { 'password123' }
    nickname { Faker::Name.unique.name }
    is_deleted { false }
    admin { false }
  end
end