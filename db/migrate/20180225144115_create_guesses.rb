class CreateGuesses < ActiveRecord::Migration[5.1]
  def change
    create_table :guesses do |t|
      t.references :game, foreign_key: true
      t.integer :number
      t.integer :delta

      t.timestamps
    end
  end
end
