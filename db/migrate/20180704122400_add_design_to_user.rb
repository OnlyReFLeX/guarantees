class AddDesignToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :design, :integer, default: 0
  end
end
