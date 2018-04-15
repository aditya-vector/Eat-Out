FactoryBot.define do
  factory :restaurant do
    name  { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::Number.number(12) }

    trait :with_shift_and_seatings do
    	after(:create) do |res|
        create_list(:work_shift, 3, restaurant: res)
        create_list(:seating_table, 2, restaurant: res)
      end
    end

    factory :restaurant_with_shift_and_seatings, traits: [:with_shift_and_seatings]
  end
end
