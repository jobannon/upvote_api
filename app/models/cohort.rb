class Cohort < ApplicationRecord
  has_many :users
  has_many :ideas

  validates_presence_of :cohort_number
end
