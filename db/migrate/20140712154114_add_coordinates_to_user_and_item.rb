class AddCoordinatesToUserAndItem < ActiveRecord::Migration
  def change

    add_column :users, :latitude, :numeric
    add_column :users, :longitude, :numeric

    add_column :items, :latitude, :numeric
    add_column :items, :longitude, :numeric

    add_index :users, [:latitude, :longitude]
    add_index :items, [:latitude, :longitude]
    remove_index :users, :location
    remove_index :items, :location
  end
end
