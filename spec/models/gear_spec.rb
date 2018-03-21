require 'rails_helper'
require 'spec_helper'

describe Gear, type: :model do

  describe "easy creation" do
    subject { build(:gear) } #This calls the factory

    it { is_expected.to validate_presence_of(:title) } #this is calling validate presence of on the subject, aka the gear in question
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to be_valid }
  end

  #Above is an easy way to run all the tests that we have below.

  describe "Creation" do
    before do
      @gear = build(:gear)
    end

    it "has a valid factory and can be created" do
      expect(@gear).to be_valid
    end

    it 'cannot be created without a title, description and user_id' do
      @gear.title = nil
      @gear.description = nil
      @gear.user_id = nil
      expect(@gear).to_not be_valid
    end
  end
end