require 'rails_helper'

RSpec.describe Routine, type: :model do
  let(:routine) { Routine.create!(name: 'Monday') }

  describe "associations" do
    it { is_expected.to have_and_belong_to_many(:exercises) }
  end
end
