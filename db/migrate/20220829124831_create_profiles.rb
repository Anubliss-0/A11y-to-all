class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.integer :score
      t.string :name
      t.string :bio
      t.string :location
      t.string :user_name

      t.timestamps
    end
  end
end
