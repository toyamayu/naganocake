class AddColumnToCartItem < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :end_user_id, :integer
    add_column :cart_items, :item_id, :integer
    add_column :cart_items, :amount, :integer
  end
end
