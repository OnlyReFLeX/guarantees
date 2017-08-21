class AddStartedToWarranty < ActiveRecord::Migration[5.1]
  def change
    add_column :warranties, :started, :string
  end
end
