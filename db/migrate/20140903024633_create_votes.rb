class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :idea_id
    end
    add_index :votes, [:user_id, :idea_id], unique: true
  end
end
