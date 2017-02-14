class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.string :image
      t.date :birthday

      t.timestamps
    end
  end
end
