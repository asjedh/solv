class Idea < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :categories

  accepts_nested_attributes_for :categories

  validates :title, presence: true
  validates :abstract, presence: true
  validates :body, presence: true
end
