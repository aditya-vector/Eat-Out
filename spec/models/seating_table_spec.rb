require 'rails_helper'

RSpec.describe SeatingTable, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to belong_to(:restaurant) }
    it { is_expected.to validate_presence_of(:min_seating) }
    it { is_expected.to validate_presence_of(:max_seating) }
    it { is_expected.to validate_numericality_of(:min_seating).only_integer }
    it { is_expected.to validate_numericality_of(:max_seating).only_integer }
    context 'when min_seating is less than max seating' do
      let(:seating_table) { build(:seating_table, min_seating: 3, max_seating: 2) }
      it 'should not be valid' do
        expect(seating_table).not_to be_valid
      end
    end
    context 'when min_seating is greater than max seating' do
      let(:seating_table) { build(:seating_table, min_seating: 1, max_seating: 3) }
      it 'should be valid' do
        expect(seating_table).to be_valid
      end
    end
  end
end
