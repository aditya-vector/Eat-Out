FactoryBot.define do
  factory :reservation do
    seating_table
    work_shift
    arrival_at Time.current
    guest
    guest_count 1
  end
end
