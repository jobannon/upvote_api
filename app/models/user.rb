class User < ApplicationRecord
  belongs_to :cohort
  has_many :ideas

  validates_presence_of :github_id
  validates_presence_of :token
  validates_presence_of :handle
end
