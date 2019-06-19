# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  belongs_to :user
  has_many :gears
  validates_presence_of :name, :user_id
end
