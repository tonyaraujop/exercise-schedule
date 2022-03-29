class Exercise < ApplicationRecord
  has_many :exercise_routines
  has_many :routines, through: :exercise_routines
  validates :description, presence: true
  validates :intensity, presence: true, inclusion: { in: 0..10 }
end
