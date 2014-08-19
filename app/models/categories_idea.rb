class CategoriesIdea < ActiveRecord::Base
  belongs_to :idea
  belongs_to :category, counter_cache: :ideas_count
end
