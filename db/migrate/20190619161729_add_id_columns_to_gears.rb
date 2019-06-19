class AddIdColumnsToGears < ActiveRecord::Migration[5.1]
  def change
    add_reference :gears, :category, index: true, foreign_key: true
    add_reference :gears, :quest, index: true, foreign_key: true
  end
end
