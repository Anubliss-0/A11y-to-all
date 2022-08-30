class CreateTools < ActiveRecord::Migration[7.0]
  def change
    create_table :tools do |t|
      t.string :title
      t.text :description
      t.string :url
      t.float :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
