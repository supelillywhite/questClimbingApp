require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit gears_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Gear' do
      visit gears_path
      expect(page).to have_content(/Gear/)
    end
  end
end