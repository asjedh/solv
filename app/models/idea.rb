class Idea < ActiveRecord::Base
  belongs_to :user
  # has_many :idea_categories, dependent: :destroy
  # has_many :categories, through: :idea_categories

  validates :title, presence: true
  validates :abstract, presence: true
  validates :body, presence: true
end
