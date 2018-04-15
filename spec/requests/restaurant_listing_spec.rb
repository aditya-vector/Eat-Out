require "rails_helper"

RSpec.describe "Restaurant List", :type => :request do

  before do
    create_list(:restaurant, 3)
  end

  it 'provides a list of all restaurants' do
    get '/api/v1/restaurants'
    expect(response.content_type).to eq('application/json')
    expect(response.status).to eq(200)
    expect(response.body).to eq(
      ActiveModel::Serializer::CollectionSerializer.new(Restaurant.all, each_serializer: RestaurantSerializer).to_json
    )
  end
end