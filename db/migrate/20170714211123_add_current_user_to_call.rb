class AddCurrentUserToCall < ActiveRecord::Migration[5.1]
  def change
    add_column :calls, :currentuser, :string
  end
end
