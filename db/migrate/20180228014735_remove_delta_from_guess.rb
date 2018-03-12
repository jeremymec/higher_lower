class RemoveDeltaFromGuess < ActiveRecord::Migration[5.1]
  def change
    remove_column :guesses, :delta, :int
  end
end
