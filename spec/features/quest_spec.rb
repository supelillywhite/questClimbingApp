require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(email: "test4@test.com", first_name: "SupeR", last_name: "DLillywhite", username: "Thesupelillywhite", password: "123456", password_confirmation: "123456")
    login_as(@user)
  end

  describe 'index' do
    it 'can be reached successfully' do
      visit quests_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Quests' do
      visit quests_path
      expect(page).to have_content(/Quests/)
    end
  end

  describe 'creation' do
    it 'has a new form that can be reached' do
      visit new_quest_path
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      visit new_quest_path
      
      fill_in 'quest[title]', with: 'Some Title'
      fill_in 'quest[description]', with: 'Some Description'
      click_on "Save"

      expect(page).to have_content("Some Description")
    end
  end
end
