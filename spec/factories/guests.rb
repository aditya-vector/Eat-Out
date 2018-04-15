FactoryBot.define do
  factory :guest do
    name  { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
