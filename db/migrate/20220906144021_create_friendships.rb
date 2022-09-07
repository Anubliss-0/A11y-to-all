class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.integer :friend1_id
      t.integer :friend2_id
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
