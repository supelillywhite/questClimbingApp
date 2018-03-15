FactoryBot.define do
	factory :gear do
		title { Faker::Hobbit.character }
    description { Faker::LordOfTheRings.location }
    association :user
  end
end