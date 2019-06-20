class RemoveQuestIdFromGears < ActiveRecord::Migration[5.1]
  def change
    remove_column :gears, :quest_id, :integer
  end
end
