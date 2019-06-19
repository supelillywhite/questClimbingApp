class AddColumnsToQuests < ActiveRecord::Migration[5.1]
  def change
    add_reference :quests, :user, index: true, foreign_key: true
    add_column :quests, :start_date, :datetime
    add_column :quests, :end_date, :datetime
  end
end
