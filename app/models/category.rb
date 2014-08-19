class Category < ActiveRecord::Base
  has_many :idea_categories
  has_many :ideas, through: :idea_categories

  validates :name, presence: true
end
