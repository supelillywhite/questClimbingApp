class DropGearsQuestsJoinTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :gears_quests
  end
end
