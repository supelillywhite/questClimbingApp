class Quest < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :gears
  validates_presence_of :title, :description, :user_id
  accepts_nested_attributes_for :gears

  def change_title
  	self.title = "Bill"
  end
end
