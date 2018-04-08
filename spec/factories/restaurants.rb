FactoryBot.define do
  factory :restaurant do
    name Faker::Name.name
    email Faker::Internet.email
    phone Faker::Number.number(12)
  end
end
