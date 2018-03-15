require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = build(:user)
    end

    it "has a valid factory" do
      expect(@user).to be_valid
    end

    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first_name, last_name, and username" do
      @user.first_name = nil
      @user.last_name = nil
      @user.username = nil
      expect(@user).to_not be_valid
    end
  end
end