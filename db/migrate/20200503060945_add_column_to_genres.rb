class AddColumnToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :name, :string
    add_column :genres, :is_valid, :boolean, default: true, null: false
  end
end
