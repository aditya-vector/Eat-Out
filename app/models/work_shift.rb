class WorkShift < ApplicationRecord
	validates :starts_at, presence: true
  validates :ends_at, presence: true
  validate :end_date_range

  def end_date_range
    return if ends_at.blank? || starts_at.blank?
    return if ends_at > starts_at
    errors.add(:ends_at, "end date can't be less than start date")
  end
end
