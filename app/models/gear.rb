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

class Gear < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :quests
  belongs_to :category
  validates_presence_of :title, :description, :user_id

  def packed_for_quest(quest_id)
    if checked_out && quest_id == checked_out_to
      "(packed)"
    else
      "(unpacked)"
    end
  end

  def in_closet
    checked_out ? "(packed for #{quests.select { |quest| quest.id == checked_out_to }.first.title})" : "(in closet)"
  end
end
