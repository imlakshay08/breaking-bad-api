class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.date :birthday
      t.text :occupation
      t.string :img
      t.string :status
      t.string :nickname
      t.text :appearance
      t.string :portrayed
      t.string :category

      t.timestamps
    end

    add_index :characters, :name
    add_index :characters, :status
    add_index :characters, :category
  end
end
