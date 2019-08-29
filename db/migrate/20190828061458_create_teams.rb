class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :author, null: false
      t.text :discription

      t.timestamps
    end
  end
end
