require 'rails_helper'

describe 'navigate' do
  describe 'homepage' do
    it 'can be reached successfully' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end

  describe 'contact page' do
    it 'can be reached successfully' do
      visit contact_path
      expect(page.status_code).to eq(200)
    end
  end

  describe 'about page' do
    it 'can be reached successfully' do
      visit about_path
      expect(page.status_code).to eq(200)
    end
  end

  
end