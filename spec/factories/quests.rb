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

FactoryBot.define do
	factory :quest do
		title { Faker::Hobbit.character }
    description { Faker::LordOfTheRings.location }
    association :user
  end
end
