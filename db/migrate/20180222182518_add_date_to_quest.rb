class AddDateToQuest < ActiveRecord::Migration[5.1]
  def change
    add_column :quests, :date, :date
  end
end
