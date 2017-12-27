class CreateCalls < ActiveRecord::Migration[5.1]
  def change
    create_table :calls do |t|
      t.string :boiler
      t.string :username
      t.string :who_created
      t.string :phone
      t.text :adress
      t.datetime :call_date
      t.string :status, default: "expect"
      t.string :master
      t.string :error
      t.text :whycanceled
      t.boolean :guarantee

      t.timestamps
    end
  end
end
