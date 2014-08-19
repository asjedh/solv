class CreateCategoriesIdeas < ActiveRecord::Migration
  def change
    create_table :categories_ideas do |t|
      t.belongs_to :idea
      t.belongs_to :category
    end
    add_index :categories_ideas, [:idea_id, :category_id], unique: true
  end
end

