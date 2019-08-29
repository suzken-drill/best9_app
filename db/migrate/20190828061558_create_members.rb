class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.references :team, foreign_key: true
      t.integer :order, null: false, default: 0
      t.string :name, null: false
      t.string :memo

      t.timestamps
    end
  end
end
