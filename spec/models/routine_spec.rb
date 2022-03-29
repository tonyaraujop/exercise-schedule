require 'rails_helper'

RSpec.describe Routine, type: :model do

  describe "associations" do
    it { is_expected.to have_and_belong_to_many(:exercises) }
  end
end
