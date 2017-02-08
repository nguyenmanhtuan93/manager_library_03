class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :details
      t.date :birthday
      t.integer :publisher_id

      t.timestamps
    end
  end
end
