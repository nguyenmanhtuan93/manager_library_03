class CreatePublishers < ActiveRecord::Migration[5.0]
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :add
      t.integer :phone
      t.string :email

      t.timestamps
    end
  end
end
