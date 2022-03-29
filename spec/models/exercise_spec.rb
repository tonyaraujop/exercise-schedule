require 'rails_helper'

RSpec.describe Exercise, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:intensity) }
    it { is_expected.to validate_inclusion_of(:intensity).in_range(0..10) }
    it { is_expected.to validate_numericality_of(:intensity).only_integer }
  end

  describe "associations" do
    it { is_expected.to have_and_belong_to_many(:routines) }
  end
end
