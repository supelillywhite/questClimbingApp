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
#  checked_out    :boolean          default(FALSE)
#  checked_out_to :integer
#

FactoryBot.define do
	factory :gear do
		title { Faker::Hobbit.character }
    description { Faker::LordOfTheRings.location }
    association :user
  end
end
