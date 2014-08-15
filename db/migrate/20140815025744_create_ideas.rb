class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title, null: false
      t.text :abstract, null: false
      t.text :body, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :ideas, :title, unique: true
  end
end
