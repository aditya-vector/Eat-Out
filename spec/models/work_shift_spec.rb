require 'rails_helper'

RSpec.describe WorkShift, type: :model do
  describe 'validations' do
    it { is_expected.to belong_to(:restaurant) }
    it { is_expected.to validate_presence_of(:starts_at) }
    it { is_expected.to validate_presence_of(:ends_at) }
    context 'when shift end time is less than shift start time' do
      let(:work_shift) {
        build(:work_shift,
          starts_at: Faker::Time.between(1.day.ago, 1.day.ago, :afternoon),
          ends_at: Faker::Time.between(1.day.ago, 1.day.ago, :morning))
      }
      it 'should not be valid' do
        expect(work_shift).not_to be_valid
      end
    end
    context 'when shift end time is greater than shift statrt time' do
      let(:work_shift) { build(:work_shift) }
      it 'should be valid' do
        expect(work_shift).to be_valid
      end
    end
  end
end
