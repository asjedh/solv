class Category < ActiveRecord::Base
  has_many :ideas, through: :categories_ideas
  has_many :categories_ideas, class_name: "CategoriesIdeas"

  validates :name, presence: true
end
