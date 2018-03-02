class Gear < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :quests
  has_and_belongs_to_many :categories
  validates_presence_of :title, :description, :user_id
end
