require 'rails_helper'

RSpec.describe Guest, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    subject { create(:guest) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to allow_value(Faker::Internet.email).for(:email) }
    it { is_expected.to_not allow_value(Faker::Name.name).for(:email) }
  end
end
