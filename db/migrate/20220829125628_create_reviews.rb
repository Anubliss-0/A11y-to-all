class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :resource_id
      t.integer :user_id
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end
