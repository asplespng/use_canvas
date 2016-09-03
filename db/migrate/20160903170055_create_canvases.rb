class CreateCanvases < ActiveRecord::Migration[5.0]
  def change
    create_table :canvases do |t|
      t.string :canvas_key
      t.string :canvas_title
      t.datetime :canvas_created
      t.datetime :canvas_updated

      t.timestamps
    end
  end
end
