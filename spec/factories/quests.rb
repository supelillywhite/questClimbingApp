FactoryBot.define do
	factory :quest do
		title { Faker::Hobbit.character }
    description { Faker::LordOfTheRings.location }
    association :user
  end
end