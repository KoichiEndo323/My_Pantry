FactoryBot.define do
  factory :storage do
    name { Faker::Name.unique.name }
  end
end