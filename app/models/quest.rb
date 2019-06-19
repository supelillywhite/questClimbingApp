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

class Quest < ApplicationRecord
  belongs_to :user
  has_many :categories
  has_many :potential_gears, class_name: "Gear", through: :categories
  has_many :gears
  validates_presence_of :title, :description, :user_id
  accepts_nested_attributes_for :gears
end
