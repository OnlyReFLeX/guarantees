class AddGuaranteeToCall < ActiveRecord::Migration[5.1]
  def change
    add_column :calls, :guarantee, :string
  end
end
