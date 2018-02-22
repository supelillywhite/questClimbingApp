class AddLocationToQuest < ActiveRecord::Migration[5.1]
  def change
    add_column :quests, :location, :text
  end
end
