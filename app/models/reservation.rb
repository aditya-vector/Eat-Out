class Reservation < ApplicationRecord
  belongs_to :work_shift
  belongs_to :guest
  belongs_to :seating_table

  validates :arrival_at, :guest_count, presence: true

  validate :matching_restaurant
  validate :guest_count_range
  validate :shift_timing_range

  def matching_restaurant
  	return if work_shift.blank? || seating_table.blank?
  	return if work_shift.restaurant_id == seating_table.restaurant_id
  	errors.add(:work_shift, I18n.t('reservation.errors.restaurant_not_matching'))
  end

  def guest_count_range
    return if guest_count.blank? || seating_table.blank?
    return if (seating_table.min_seating..seating_table.max_seating).cover?(guest_count)
    errors.add(:guest_count, I18n.t('reservation.errors.invalid_guest_count'))
  end

  def shift_timing_range
  	return if arrival_at.blank? || work_shift.blank?
  	shift_range = work_shift.starts_at..work_shift.ends_at
  	return if shift_range.cover?(arrival_at)
  	errors.add(:arrival_at, I18n.t('reservation.errors.arrival_at_invalid', shift_range: shift_range))
  end
end
