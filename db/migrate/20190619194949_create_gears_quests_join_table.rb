class CreateGearsQuestsJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :gears_quests, id: false do |t|
      t.integer :gear_id
      t.integer :quest_id
    end

    add_index :gears_quests, :gear_id
    add_index :gears_quests, :quest_id
  end
end
