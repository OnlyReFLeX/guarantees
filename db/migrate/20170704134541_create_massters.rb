class CreateMassters < ActiveRecord::Migration[5.1]
  def change
    create_table :massters do |t|
      t.string :name

      t.timestamps
    end
  end
end
