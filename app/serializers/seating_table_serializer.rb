class SeatingTableSerializer < ActiveModel::Serializer
  attributes :id, :name, :min_seating, :max_seating
end
