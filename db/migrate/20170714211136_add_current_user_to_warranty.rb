class AddCurrentUserToWarranty < ActiveRecord::Migration[5.1]
  def change
    add_column :warranties, :currentuser, :string
  end
end
