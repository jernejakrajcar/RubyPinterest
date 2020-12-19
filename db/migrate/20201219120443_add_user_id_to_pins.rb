class AddUserIdToPins < ActiveRecord::Migration[6.0]
  def change
    add_column :pins, :user_id, :integer
    add_index :pins, :user_id
    add_foreign_key :pins, :users, column: :user_id
  end
end
