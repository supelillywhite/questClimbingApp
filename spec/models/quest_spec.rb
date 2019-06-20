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
require 'spec_helper'

describe Quest, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }

  describe "#available_gears and #packed_gears" do
    it "does some magic" do
      category = create(:category)
      not_checked_out_gear = create(
        :gear,
        category: category,
        user: category.user
      )
      quest = create(:quest, user: category.user)
      checked_out_gear = create(
        :gear,
        category: category,
        user: category.user
      )
      quest.gears << not_checked_out_gear
      quest.gears << checked_out_gear
      quest.save!

      expect(quest.available_gears.first.id).to eq(not_checked_out_gear.id)
      expect(quest.available_gears.second.id).to eq(checked_out_gear.id)
      expect(quest.packed_gears).to eq([])

      checked_out_gear.checked_out = true
      checked_out_gear.checked_out_to = quest.id
      checked_out_gear.save!

      expect(quest.available_gears.first.id).to eq(not_checked_out_gear.id)
      expect(quest.packed_gears.first.id).to eq(checked_out_gear.id)
    end
  end
end
