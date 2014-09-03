class AddVotesCountToIdeasTable < ActiveRecord::Migration
  def change
    add_column :ideas, :votes_count, :integer, null: false, default: 0
  end
end
