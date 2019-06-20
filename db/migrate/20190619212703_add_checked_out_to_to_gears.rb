class AddCheckedOutToToGears < ActiveRecord::Migration[5.1]
  def change
    add_column :gears, :checked_out_to, :integer
  end
end
