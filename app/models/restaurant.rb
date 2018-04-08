class Restaurant < ApplicationRecord
	validates_presence_of :name
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
  validates :phone, presence: true, numericality: { only_integer: true }, length: { in: 6..15 }
end
