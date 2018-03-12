class RemoveScoreFromGames < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :score, :int
  end
end
