class RenameColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :addres_option, :address_option
  end
end
