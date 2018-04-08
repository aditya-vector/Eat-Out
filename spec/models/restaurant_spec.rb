require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_numericality_of(:phone).only_integer }
    subject { create(:restaurant) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to allow_value(Faker::Internet.email).for(:email) }
    it { is_expected.to_not allow_value(Faker::Name.name).for(:email) }
  end
end
