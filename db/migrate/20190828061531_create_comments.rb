class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :team, foreign_key: true
      t.string :name, null: false
      t.text :comment, null: false
      t.string :user_ip, null: false, limit: 50

      t.timestamps
    end
  end
end
