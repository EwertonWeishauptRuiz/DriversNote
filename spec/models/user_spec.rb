require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryBot.build(:user) }

  describe "associations" do
    it { should have_many(:addresses) }
    it { should have_many(:orders) }
  end

  describe "validations" do
    it { should validate_presence_of(:full_name) }
    it { should validate_presence_of(:sub_seats) }
    it { should validate_numericality_of(:sub_seats).only_integer }
  end
end
