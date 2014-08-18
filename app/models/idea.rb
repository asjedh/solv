class Idea < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :abstract, presence: true
  validates :body, presence: true
end
