class CreateBoilers < ActiveRecord::Migration[5.1]
  def change
    create_table :boilers do |t|
      t.string :name

      t.timestamps
    end
  end
end
