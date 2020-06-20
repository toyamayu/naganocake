class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :item_id
      t.string :name
      t.integer :price
      t.integer :total_order
      t.integer :production_status, default: 0, null: false

      t.timestamps
    end
  end
end
