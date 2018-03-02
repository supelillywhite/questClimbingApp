require 'rails_helper'

RSpec.describe Quest, type: :model do
  describe "Creation" do
    before do
      @user = User.create(email: "test4@test.com", first_name: "SupeR", last_name: "DLillywhite", username: "Thesupelillywhite", password: "123456", password_confirmation: "123456")
      @quest = Quest.create(title: "test title", description: "test description", user_id: @user.id)
    end

    it 'can be created' do
      expect(@quest).to be_valid
    end

    it 'cannot be created without a title, description and user_id' do
      @quest.title = nil
      @quest.description = nil
      @user.id = nil
      expect(@quest).to_not be_valid
    end
  end
end