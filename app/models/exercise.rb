class Exercise < ApplicationRecord
  has_and_belongs_to_many :routines
  validates :description, presence: true
  validates :intensity, presence: true, inclusion: { in: 0..10 }, numericality: { only_integer: true }
end
