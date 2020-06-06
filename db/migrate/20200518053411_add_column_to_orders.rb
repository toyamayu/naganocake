class AddColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :addres_option, :integer
  end
end
