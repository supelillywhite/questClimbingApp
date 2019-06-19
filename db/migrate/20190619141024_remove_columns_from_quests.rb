class RemoveColumnsFromQuests < ActiveRecord::Migration[5.1]
  def change
    remove_column :quests, :user_id, :integer
    remove_column :quests, :date, :date
  end
end
