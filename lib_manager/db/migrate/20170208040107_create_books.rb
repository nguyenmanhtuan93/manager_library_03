class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :number_of_pages
      t.date :year
      t.string :languages
      t.string :image
      t.integer :book_numbers
      t.float :rating
      t.integer :publisher_id

      t.timestamps
    end
  end
end
