class Category < ApplicationRecord
  has_many :profile_categories
  has_many :profiles, through: :profile_categories
  has_many :tool_categories
  has_many :tools, through: :tool_categories
  validates :name, presence: true
  validates :name, length: {maximum: 50}
end
