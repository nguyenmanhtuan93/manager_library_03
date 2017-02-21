class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :numbers_page
      t.date :year
      t.string :languages
      t.string :picture
      t.integer :numbers_initial
      t.integer :numbers_borrowed, default: 0
      t.float :rating
      t.integer :publisher_id


      t.timestamps
    end
  end
end
