class ChangeIndicesForUser < ActiveRecord::Migration
  def change
    remove_index :users, :email
    add_index :users, :session_token
  end
end
