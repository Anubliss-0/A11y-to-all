class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.integer :score
      t.string :name
      t.text :bio
      t.string :location
      t.string :user_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
