class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :arrival_at, :guest_count

  belongs_to :guest
  belongs_to :seating_table
end
