class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.integer :resource_id
      t.integer :list_id

      t.timestamps
    end
  end
end
