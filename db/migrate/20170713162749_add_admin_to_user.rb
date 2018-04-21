class AddAdminToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :type, :string, default: 'User'
  end
end
