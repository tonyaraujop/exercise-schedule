require 'rails_helper'

RSpec.describe Exercise, type: :model do
  let(:exercise) { Exercise.create!(name: 'Squat', description: 'squat bellow 90°', intensity: 4) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:intensity) }
    it { is_expected.to validate_inclusion_of(:intensity).in_range(0..10) }
  end

  describe "associations" do
    it { is_expected.to have_many(:routines).through(:exercise_routines) }
    it { is_expected.to have_many(:exercise_routines) }
  end
end
