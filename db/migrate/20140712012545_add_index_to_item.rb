class AddIndexToItem < ActiveRecord::Migration
  def change
    add_index :items, :location
  end
end
