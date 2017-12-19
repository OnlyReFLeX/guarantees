class AddWarrantyIdToCalls < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :calls, :warranty
  end
end
