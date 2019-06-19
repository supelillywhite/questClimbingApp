FactoryBot.define do
  factory :category do
    name { Faker::Hobbit.character }
    association :user
  end
end
