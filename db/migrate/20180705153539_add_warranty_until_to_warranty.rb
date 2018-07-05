class AddWarrantyUntilToWarranty < ActiveRecord::Migration[5.1]
  def change
    add_column :warranties, :warranty_until, :date
  end
end
