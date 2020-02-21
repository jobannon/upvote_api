require 'rails_helper'

RSpec.describe Cohort, type: :model do
  describe 'relationships' do
    it { should have_many(:users) }
    it { should have_many(:ideas) }
  end

  describe 'validations' do
    it { should validate_presence_of(:cohort) }
  end
end
