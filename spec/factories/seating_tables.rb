FactoryBot.define do
  factory :seating_table do
    name { Faker::Name.name }
    min_seating 1
    max_seating 8
    restaurant
  end
end
