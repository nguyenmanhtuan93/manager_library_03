class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :is_admin, default: false
      t.boolean :is_borrow, default: true
      t.integer :borrow_out_date, default: 0
      t.string :remember_digest

      t.timestamps
    end
  end
end
