class AddUserIdToGear < ActiveRecord::Migration[5.1]
  def change
    add_column :gears, :user_id, :integer
  end
end
