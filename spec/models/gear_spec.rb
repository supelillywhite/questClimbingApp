require 'rails_helper'
require 'spec_helper'

RSpec.describe Gear, type: :model do
  describe "Creation" do
    before do
      @gear = build(:gear)
    end

    it "has a valid factory" do
      expect(@gear).to be_valid
    end

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:user_id) }

    it 'can be created' do
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