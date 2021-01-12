class RemoveFieldNameFromGames < ActiveRecord::Migration[6.0]
  def change
    remove_reference :games, :computer, null: false, foreign_key: true
  end
end
