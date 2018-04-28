class CreateCalls < ActiveRecord::Migration[5.1]
  def change
    create_table :calls do |t|
      t.string :username
      t.string :phone
      t.text :adress
      t.date :call_date
      t.string :status, default: "expect"
      t.string :error
      t.text :whycanceled
      t.text :infosuccess
      t.boolean :guarantee
      t.text :comment
      t.references :product_model
      t.references :user
      t.references :master
      t.references :warranty

      t.timestamps
    end
  end
end
