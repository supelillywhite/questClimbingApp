class AddUserIdToQuest < ActiveRecord::Migration[5.1]
  def change
    add_column :quests, :user_id, :integer
  end
end
