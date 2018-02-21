class User < ApplicationRecord
  has_many :quests
  has_many :gears
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
