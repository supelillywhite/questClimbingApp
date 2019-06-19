# == Schema Information
#
# Table name: quests
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  picture     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location    :text
#  user_id     :bigint
#  start_date  :datetime
#  end_date    :datetime
#

require 'rails_helper'

RSpec.describe Quest, type: :model do
  describe "Creation" do
    before do
      @quest = build(:quest)
    end

    it "has a valid factory" do
      expect(@quest).to be_valid
    end

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it {is_expected.to validate_presence_of(:user_id) }

    it 'can be created' do
      expect(@quest).to be_valid
    end

    it 'cannot be created without a title, description and user_id' do
      @quest.title = nil
      @quest.description = nil
      @quest.user_id = nil
      expect(@quest).to_not be_valid
    end
    
  end
end
