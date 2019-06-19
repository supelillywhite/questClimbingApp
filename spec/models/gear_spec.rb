# == Schema Information
#
# Table name: gears
#
#  id             :bigint           not null, primary key
#  title          :string
#  description    :text
#  picture        :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  date_purchased :date
#  user_id        :bigint
#  category_id    :bigint
#  quest_id       :bigint
#

require 'rails_helper'
require 'spec_helper'

describe Gear, type: :model do

  it { is_expected.to validate_presence_of(:title) } #this is calling validate presence of on the subject, aka the gear in question
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:category_id) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to be_valid }
end
