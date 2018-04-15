FactoryBot.define do
  factory :work_shift do
  	restaurant
    starts_at { Faker::Time.between(1.day.ago, 1.day.ago, :morning) }
    ends_at { Faker::Time.between(1.day.ago, 1.day.ago, :afternoon) }
  end
end
