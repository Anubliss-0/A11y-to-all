class Tool < ApplicationRecord
  belongs_to :user
  has_many :tool_categories
  has_many :categories, through: :tool_categories
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  has_many :reviews
end
