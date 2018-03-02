class CreateJoinTableGearsCategories < ActiveRecord::Migration[5.1]
  def change
    create_join_table :gears, :categories do |t|
      # t.index [:gear_id, :category_id]
      # t.index [:category_id, :gear_id]
    end
  end
end
