class CreateIdeaCategories < ActiveRecord::Migration
  def change
    create_table :idea_categories do |t|
      t.integer :idea_id
      t.integer :category_id

      t.timestamps
    end

    add_index :idea_categories, [:idea_id, :category_id], unique: true
  end
end
