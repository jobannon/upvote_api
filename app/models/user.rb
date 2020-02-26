class User < ApplicationRecord
  belongs_to :cohort
  has_many :ideas

  validates_presence_of :github_id
  validates_presence_of :token
  validates_presence_of :handle

  def self.create_user(auth_hash)
    cohort = Cohort.last
    self.create!(github_id: auth_hash[:uid], token: auth_hash[:credentials][:token], handle: auth_hash[:info][:nickname], cohort_id: cohort.id)
  end
end
