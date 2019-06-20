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
  has_and_belongs_to_many :gears
  validates_presence_of :title, :description, :user_id, :start_date, :end_date
  accepts_nested_attributes_for :gears
  # has_and_belongs_to_many :available_gears, -> { where(checked_out: false) }, class_name: "Gear", foreign_key: :gear_id

  def packed_gears
    gears.select(&:checked_out).select { |gear| gear.checked_out_to == id }
  end

  def available_gears
    if gears.present?
      gears.select { |gear| gear.checked_out == false }
    end
  end
end
