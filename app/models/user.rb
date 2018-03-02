class User < ApplicationRecord
  has_many :quests
  has_many :gears
  has_many :categories
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
