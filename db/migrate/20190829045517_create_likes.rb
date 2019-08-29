class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :team, foreign_key: true
      t.string :session_key, null: false

      t.timestamps
    end
    add_index :likes, [:team_id, :session_key], unique: true
  end
end
