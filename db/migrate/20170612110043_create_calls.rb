class CreateCalls < ActiveRecord::Migration[5.1]
  def change
    create_table :calls do |t|
      t.string :boiler
      t.string :username
      t.string :who_created
      t.string :phone
      t.text :adress
      t.text :date
      t.string :success
      t.string :master
      t.string :error
      t.string :guarantee

      t.timestamps
    end
  end
end
