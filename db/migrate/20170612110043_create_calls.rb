class CreateCalls < ActiveRecord::Migration[5.1]
  def change
    create_table :calls do |t|
      t.string :kotel
      t.string :username
      t.text :phone
      t.text :adress
      t.text :date
      t.text :success
      t.text :master
      t.text :error

      t.timestamps
    end
  end
end
