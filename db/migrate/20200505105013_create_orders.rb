class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.integer :total_price
      t.string :address_user_name
      t.string :address
      t.string :postal_code
      t.integer :delivery_price
      t.integer :pay_way, default: 0
      t.integer :order_status, default: 0
      t.integer :address_option
      t.timestamps
    end
  end
end
