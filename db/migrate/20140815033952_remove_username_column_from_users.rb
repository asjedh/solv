class RemoveUsernameColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :username, :string, null:false
  end
end
