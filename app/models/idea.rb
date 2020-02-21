class Idea < ApplicationRecord
  belongs_to :cohort
  belongs_to :user

  validates_presence_of :title
  validates_presence_of :pitch
  validates_presence_of :problem
  validates_presence_of :solution
  validates_presence_of :audience
  validates_presence_of :features
  validates_presence_of :apis
  validates_presence_of :oauth
end
