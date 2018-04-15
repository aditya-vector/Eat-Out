require "rails_helper"

RSpec.describe "Create Reservation", :type => :request do

  before do
    create_list(:restaurant, 3)
  end
  let(:restaurant) {
    Restaurant.first
  }
  let(:work_shift) {
    restaurant.work_shifts.first
  }
  let(:guest) {
    create(:guest)
  }
  let(:seating_table) {
    restaurant.seating_tables.first
  }
  it 'creates a reservation' do
    post '/api/v1/reservations', params: { 
      reservation: {
        work_shift_id: work_shift.id,
        arrival_at: rand(work_shift.starts_at..work_shift.ends_at),
        guest_count: 4,
        guest_id: guest.id,
        seating_table_id: seating_table.id 
      }
    }
    expect(response.content_type).to eq('application/json')
    expect(response.status).to eq(200)
    expect(response.body).to eq(
      ActiveModelSerializers::SerializableResource.new(Reservation.last).to_json
    )
  end

  it 'does not create reservation with invalid attributes' do
    post '/api/v1/reservations', params: { 
      reservation: {
        work_shift_id: work_shift.id,
        arrival_at: work_shift.ends_at + 2.hours,
        guest_count: 11,
        guest_id: guest.id,
        seating_table_id: seating_table.id 
      }
    }
    expect(response.content_type).to eq('application/json')
    expect(response.status).to eq(422)
    expect(response.body).not_to eq(
      ActiveModelSerializers::SerializableResource.new(Reservation.last).to_json
    )
    response_body = JSON.parse(response.body)
    expect(response_body['errors']).not_to be_blank
  end
end