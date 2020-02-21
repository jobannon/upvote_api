require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe 'relationships' do
    it { should belong_to(:cohort) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:pitch) }
    it { should validate_presence_of(:problem) }
    it { should validate_presence_of(:solution) }
    it { should validate_presence_of(:audience) }
    it { should validate_presence_of(:features) }
    it { should validate_presence_of(:apis) }
    it { should validate_presence_of(:oauth) }
  end
end
