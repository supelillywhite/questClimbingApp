class AddCategoryToQuest < ActiveRecord::Migration[5.1]
  def change
    add_column :quests, :category, :string
  end
end
