FactoryBot.define do
	factory :user do
		first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"
  end
end