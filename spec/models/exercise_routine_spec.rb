require 'rails_helper'

RSpec.describe ExerciseRoutine, type: :model do
  describe "associations" do
    it { should belong_to(:exercise) }
    it { should belong_to(:routine) }
  end
end
