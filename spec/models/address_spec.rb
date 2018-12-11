require 'rails_helper'

RSpec.describe Address, type: :model do
  before { @address = FactoryBot.build(:address) }
  
  describe "associations" do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:address1) }
    it { should validate_presence_of(:postal_code) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:country) }
  end
end
