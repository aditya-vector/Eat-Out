require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do
    it { is_expected.to belong_to(:work_shift) }
    it { is_expected.to belong_to(:seating_table) }
    it { is_expected.to belong_to(:guest) }
    it { is_expected.to validate_presence_of(:arrival_at) }
    it { is_expected.to validate_presence_of(:guest_count) }
    describe 'restaurant validation' do
      context 'selected shift and seating table restaurants do not match' do
        let(:work_shift) {
          create(:work_shift)
        }
        let(:seating_table) {
          create(:seating_table)
        }
        let(:guest) {
          create(:guest)
        }
        let(:reservation) {
          build(:reservation, 
            work_shift: work_shift, 
            seating_table: seating_table, 
            guest: guest
          )
        }
        it 'should not be valid' do
          expect(reservation).not_to be_valid
          expect(reservation.errors[:work_shift]).not_to be_empty
        end
      end
    end
    describe 'guest count validations' do
      context 'when guest count is greater than allowed guests at the table' do
        let(:work_shift) {
          create(:work_shift)
        }
        let(:seating_table) {
          create(:seating_table, restaurant: work_shift.restaurant)
        }
        let(:guest) {
          create(:guest)
        }
        let(:reservation) {
          build(:reservation, 
            work_shift: work_shift, 
            seating_table: seating_table, 
            guest: guest,
            guest_count: seating_table.max_seating + 2
          )
        }
        it 'should not be valid' do
          expect(reservation).not_to be_valid
          expect(reservation.errors[:guest_count]).not_to be_empty
        end
      end
      context 'when guest count is less than allowed guests at the table' do
        let(:work_shift) {
          create(:work_shift)
        }
        let(:seating_table) {
          create(:seating_table, restaurant: work_shift.restaurant)
        }
        let(:guest) {
          create(:guest)
        }        
        let(:reservation) {
          build(:reservation, 
            work_shift: work_shift, 
            seating_table: seating_table, 
            guest: guest,
            guest_count: seating_table.min_seating - 1
          )
        }
        it 'should not be valid' do
          expect(reservation).not_to be_valid
          expect(reservation.errors[:guest_count]).not_to be_empty
        end
      end
      context 'when guest count between allowed guests at the table' do
        let(:work_shift) {
          create(:work_shift)
        }
        let(:seating_table) {
          create(:seating_table, restaurant: work_shift.restaurant)
        }
        let(:guest) {
          create(:guest)
        }        
        let(:reservation) {
          build(:reservation, 
            work_shift: work_shift, 
            seating_table: seating_table, 
            guest: guest,
            guest_count: rand(seating_table.min_seating..seating_table.max_seating)
          )
        }
        it 'should be valid for guest count' do
          expect(reservation.errors[:guest_count]).to be_empty
        end
      end
    end
    describe 'shift validations' do
      context 'when shift time is not in between selected work shift timings' do
        let(:work_shift) {
          create(:work_shift)
        }
        let(:seating_table) {
          create(:seating_table)
        }
        let(:guest) {
          create(:guest)
        }        
        let(:reservation) {
          build(:reservation, 
            work_shift: work_shift, 
            seating_table: seating_table, 
            guest: guest,
            guest_count: rand(seating_table.min_seating..seating_table.max_seating),
            arrival_at: work_shift.ends_at + 2.hours
          )
        }
        it 'should not be valid' do
          expect(reservation).not_to be_valid
          expect(reservation.errors[:arrival_at]).not_to be_empty
        end
      end

      context 'when shift time is in between selected work shift timings' do
        let(:work_shift) {
          create(:work_shift)
        }
        let(:seating_table) {
          create(:seating_table)
        }
        let(:guest) {
          create(:guest)
        }        
        let(:reservation) {
          build(:reservation, 
            work_shift: work_shift, 
            seating_table: seating_table, 
            guest: guest,
            guest_count: rand(seating_table.min_seating..seating_table.max_seating),
            arrival_at: rand(work_shift.starts_at..work_shift.ends_at)
          )
        }
        it 'should be valid for shift time' do
          expect(reservation.errors[:arrival_at]).to be_empty
        end
      end
    end
  end
end
