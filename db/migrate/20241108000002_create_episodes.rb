class CreateEpisodes < ActiveRecord::Migration[7.1]
  def change
    create_table :episodes do |t|
      t.string :title, null: false
      t.integer :season, null: false
      t.integer :episode, null: false
      t.date :air_date
      t.text :characters
      t.string :series

      t.timestamps
    end

    add_index :episodes, :season
    add_index :episodes, :episode
    add_index :episodes, [:season, :episode], unique: true
  end
end
