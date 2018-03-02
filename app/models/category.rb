class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :gears
  validates_presence_of :category, :user_id
end
