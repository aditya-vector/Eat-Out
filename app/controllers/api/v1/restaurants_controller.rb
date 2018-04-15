class Api::V1::RestaurantsController < ApplicationController
  def index
    # TODO: Paginate restaurants
  	render json: Restaurant.all, each_serializer: RestaurantSerializer
  end
end
