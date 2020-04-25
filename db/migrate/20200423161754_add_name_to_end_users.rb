class AddNameToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :last_name, :string
    add_column :end_users, :first_name, :string
    add_column :end_users, :last_name_kana, :string
    add_column :end_users, :first_name_kana, :string
    add_column :end_users, :postal_code, :string
    add_column :end_users, :address, :string
    add_column :end_users, :phone_number, :string
  end
end
