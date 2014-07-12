class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :item_id, null: false
      t.integer :owner_id, null: false
      t.integer :recipient_id, null: false
      t.string :status

      t.timestamps
    end

    add_index :offers, :recipient_id
    add_index :offers, :owner_id
  end
end
