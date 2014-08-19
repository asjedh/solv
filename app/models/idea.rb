class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :categories_ideas, dependent: :destroy, class_name: "CategoriesIdeas"
  has_many :categories, through: :categories_ideas
  accepts_nested_attributes_for :categories

  validates :title, presence: true
  validates :abstract, presence: true
  validates :body, presence: true
end
