class RemoveLivesLeftFromGame < ActiveRecord::Migration[5.1]
  def change
    remove_column :games, :lives_left, :int
  end
end
