class WorkShift < ApplicationRecord

  belongs_to :restaurant

  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validate :end_date_range


  def end_date_range
    return if ends_at.blank? || starts_at.blank?
    return if ends_at > starts_at
    errors.add(:ends_at, I18n.t('work_shift.errors.invalid_shift_range'))
  end
end
