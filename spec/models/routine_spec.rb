require 'rails_helper'

RSpec.describe Routine, type: :model do
  let(:routine) { Routine.create!(name: 'Monday') }

  describe "associations" do
    it { is_expected.to have_many(:exercises).through(:exercise_routines) }
    it { is_expected.to have_many(:exercise_routines) }
  end
end
