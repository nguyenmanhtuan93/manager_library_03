class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :ownerable_id
      t.string :ownerable_type
      t.integer :targetable_id
      t.string :targetable_type

      t.timestamps
    end
    add_index :relationships, :ownerable_id
    add_index :relationships, :targetable_id
    add_index :relationships, [:ownerable_id, :targetable_id], unique: true
  end
end
