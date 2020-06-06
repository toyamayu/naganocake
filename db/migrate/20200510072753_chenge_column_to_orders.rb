class ChengeColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :postalcode, :postal_code
  end
end
