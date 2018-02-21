class CreateGears < ActiveRecord::Migration[5.1]
  def change
    create_table :gears do |t|
      t.string :title
      t.text :description
      t.text :picture

      t.timestamps
    end
  end
end
