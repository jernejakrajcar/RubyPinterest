class CreatePins < ActiveRecord::Migration[6.0]
  def change
    create_table :pins do |t|
      t.string :title
      t.text :description
      t.text :picture

      t.timestamps
    end
  end
end
