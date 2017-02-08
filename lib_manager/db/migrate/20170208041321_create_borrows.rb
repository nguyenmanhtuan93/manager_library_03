class CreateBorrows < ActiveRecord::Migration[5.0]
  def change
    create_table :borrows do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.date :borrow_start
      t.date :borrow_end
      t.boolean :is_eccept, default: false

      t.timestamps
    end
  end
end
