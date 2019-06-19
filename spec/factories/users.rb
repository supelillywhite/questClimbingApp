# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  first_name             :string
#  last_name              :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

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
