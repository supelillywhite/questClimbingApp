class RemoveGearFromQuests < ActiveRecord::Migration[5.1]
  def change
    remove_column :quests, :gear, :string
  end
end
