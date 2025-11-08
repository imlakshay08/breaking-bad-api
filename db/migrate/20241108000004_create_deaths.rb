class CreateDeaths < ActiveRecord::Migration[7.1]
  def change
    create_table :deaths do |t|
      t.string :death, null: false
      t.string :cause, null: false
      t.string :responsible
      t.string :last_words
      t.integer :season
      t.integer :episode
      t.integer :number_of_deaths, default: 1

      t.timestamps
    end

    add_index :deaths, :death
    add_index :deaths, :responsible
    add_index :deaths, :season
  end
end
