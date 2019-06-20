class AddCheckedOutToGears < ActiveRecord::Migration[5.1]
  def change
    add_column :gears, :checked_out, :boolean, default: false
  end
end
