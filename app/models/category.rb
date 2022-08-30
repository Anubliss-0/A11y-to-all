class Category < ApplicationRecord
  has_many :user_categories
  has_many :users, through: :user_categories
  has_many :tool_categories
  has_many :tools, through: :tool_categories
end
