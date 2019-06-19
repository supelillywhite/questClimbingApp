class CreateCategoriesGearsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_quests, id: false do |t|
      t.integer :category_id
      t.integer :quest_id
    end

    add_index :categories_quests, :category_id
    add_index :categories_quests, :quest_id
  end
end
