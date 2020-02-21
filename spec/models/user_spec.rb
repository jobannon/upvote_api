require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:ideas) }
    it { should belong_to(:cohort) }
  end

  describe 'validations' do
    it { should validate_presence_of(:github_id) }
    it { should validate_presence_of(:token) }
    it { should validate_presence_of(:handle) }
  end
end
