class CategoriesIdeas < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, counter_cache: :ideas_count
end
