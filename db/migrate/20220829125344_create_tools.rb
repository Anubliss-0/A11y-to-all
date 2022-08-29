class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :user_id
      t.integer :rating

      t.timestamps
    end
  end
end
