class AddBoardIdToPins < ActiveRecord::Migration[6.0]
  def change
    add_column :pins, :board_id, :integer
  end
end
