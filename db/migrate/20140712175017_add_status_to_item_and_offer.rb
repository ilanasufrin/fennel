class AddStatusToItemAndOffer < ActiveRecord::Migration
  def change
    add_column :items, :status, :integer, default: 0
    change_column :offers, :status, :integer, default: 0

    add_index :items, :status
    add_index :offers, :status
  end
end
