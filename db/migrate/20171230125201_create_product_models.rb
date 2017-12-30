class CreateProductModels < ActiveRecord::Migration[5.1]
  def change
    create_table :product_models do |t|
      t.string :name
      t.references :boiler, foreign_key: true

      t.timestamps
    end
  end
end
