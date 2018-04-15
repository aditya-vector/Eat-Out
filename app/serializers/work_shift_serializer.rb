class WorkShiftSerializer < ActiveModel::Serializer
  attributes :id, :starts_at, :ends_at
end
