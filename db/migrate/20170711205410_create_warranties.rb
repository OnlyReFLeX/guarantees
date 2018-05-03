class CreateWarranties < ActiveRecord::Migration[5.1]
  def change
    create_table :warranties do |t|
      t.string :name
      t.string :phone
      t.string :adress
      t.date :datefirststart
      t.date :datebuyed
      t.boolean :started
      t.text :comment
      t.string :serial
      t.references :product_model
      t.references :master
      t.references :user

      t.timestamps
    end
  end
end
