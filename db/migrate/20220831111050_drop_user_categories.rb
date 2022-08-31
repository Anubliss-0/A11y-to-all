class DropUserCategories < ActiveRecord::Migration[7.0]
  def change
    drop_table :user_categories
  end
end
