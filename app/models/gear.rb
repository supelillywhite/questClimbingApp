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

class Gear < ApplicationRecord
  belongs_to :user
  belongs_to :quest, optional: true
  belongs_to :category
  validates_presence_of :title, :description, :user_id
end
