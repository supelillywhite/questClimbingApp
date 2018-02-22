class Gear < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :quests
  validates_presence_of :title, :description, :user_id
end
