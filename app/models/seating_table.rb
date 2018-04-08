class SeatingTable < ApplicationRecord
  belongs_to :restaurant

  validates :restaurant, presence: true
  validates_presence_of :name
  validates :min_seating, presence: true, numericality: {
  	only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: Proc.new{ |obj| obj.max_seating } }
  validates :max_seating, presence: true, numericality: {
  	only_integer: true, greater_than_or_equal_to: Proc.new{ |obj| obj.min_seating } }
end
