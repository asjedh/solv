class CreateCategoriesIdeas < ActiveRecord::Migration
  def change
    create_table :categories_ideas, id: false do |t|
      t.belongs_to :idea
      t.belongs_to :category
    end
  end
end

