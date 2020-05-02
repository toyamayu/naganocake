class AddCulmunToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :name, :string
    add_column :items, :introduction, :text
    add_column :items, :notax_price, :integer
    add_column :items, :image, :string
    add_column :items, :is_capable, :boolean, default: true, null: false
  end
end
