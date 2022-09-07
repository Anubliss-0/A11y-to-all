class RemoveProfileIdFromFriendships < ActiveRecord::Migration[7.0]
  def change
    remove_column :friendships, :profile_id
  end
end
