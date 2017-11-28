class CreateWarranties < ActiveRecord::Migration[5.1]
  def change
    create_table :warranties do |t|
      t.string :name
      t.string :phone
      t.string :boiler
      t.string :model
      t.string :adress
      t.string :serial
      t.string :datefirststart
      t.string :whodidfirststart
      t.string :datebuyed
      t.string :who_created
      t.string :started

      t.timestamps
    end
  end
end
