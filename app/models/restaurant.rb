class Restaurant < ApplicationRecord
  include ProfileValidations
  validates :phone, presence: true, numericality: { only_integer: true }, length: { in: 6..15 }

  has_many :seating_tables
end
