class CreateJoinTableQuestsGears < ActiveRecord::Migration[5.1]
  def change
    create_join_table :quests, :gears do |t|
      # t.index [:quest_id, :gear_id]
      # t.index [:gear_id, :quest_id]
    end
  end
end
