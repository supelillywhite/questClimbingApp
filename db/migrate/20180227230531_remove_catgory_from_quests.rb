class RemoveCatgoryFromQuests < ActiveRecord::Migration[5.1]
  def change
    remove_column :quests, :category, :string
  end
end
