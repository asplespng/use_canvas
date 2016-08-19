class CreateMovements < ActiveRecord::Migration[5.0]
  def change
    create_table :movements do |t|
      t.string :name
      t.text :description
      t.integer :kind

      t.timestamps
    end
  end
end
