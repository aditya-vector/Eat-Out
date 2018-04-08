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
      it 'should not be valid' do
        subject { create(:seating_table, min_seating: 3, max_seating: 2) }
        expect(subject).not_to be_valid
      end
    end
  end
end
