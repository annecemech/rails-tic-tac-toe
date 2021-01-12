class CreateCells < ActiveRecord::Migration[6.0]
  def change
    create_table :cells do |t|
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
