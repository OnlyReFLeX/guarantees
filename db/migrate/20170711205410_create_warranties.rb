class CreateWarranties < ActiveRecord::Migration[5.1]
  def change
    create_table :warranties do |t|
      t.string :name
      t.string :phone
      t.string :boiler
      t.string :model
      t.string :adress
      t.string :serial
      t.datetime :datefirststart
      t.string :whodidfirststart
      t.datetime :datebuyed
      t.string :who_created
      t.boolean :started
      t.text :comment

      t.timestamps
    end
  end
end
