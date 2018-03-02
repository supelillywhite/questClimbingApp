require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = User.create(email: "test4@test.com", first_name: "SupeR", last_name: "DLillywhite", username: "Thesupelillywhite", password: "123456", password_confirmation: "123456")
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