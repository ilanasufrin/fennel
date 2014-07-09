class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.column :email, :string, null: false
      t.column :name, :string
      t.column :location, :string

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
