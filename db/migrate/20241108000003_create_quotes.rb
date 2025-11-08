class CreateQuotes < ActiveRecord::Migration[7.1]
  def change
    create_table :quotes do |t|
      t.text :quote, null: false
      t.string :author, null: false
      t.string :series

      t.timestamps
    end

    add_index :quotes, :author
  end
end
