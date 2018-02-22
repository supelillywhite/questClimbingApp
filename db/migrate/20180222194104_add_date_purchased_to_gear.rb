class AddDatePurchasedToGear < ActiveRecord::Migration[5.1]
  def change
    add_column :gears, :date_purchased, :date
  end
end
