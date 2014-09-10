class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :categories_ideas, dependent: :destroy
  has_many :categories, through: :categories_ideas

  accepts_nested_attributes_for :categories

  acts_as_commentable

  validates :title, presence: true
  validates :abstract, presence: true
  validates :body, presence: true

  def self.search(search_params)
    where("title ILIKE :search OR abstract ILIKE
      :search OR body ILIKE :search", search: "%#{search_params}%")
  end
end
