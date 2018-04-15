class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone
  has_many :seating_tables
  has_many :work_shifts
end
