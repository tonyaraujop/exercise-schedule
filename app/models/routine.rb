class Routine < ApplicationRecord
  has_and_belongs_to_many :exercises
  accepts_nested_attributes_for :exercises
end
