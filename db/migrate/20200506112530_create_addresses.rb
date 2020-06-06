class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.integer :end_user_id
      t.string :addresse
      t.string :postal_code
      t.string  :name
      t.timestamps
    end
  end
end
