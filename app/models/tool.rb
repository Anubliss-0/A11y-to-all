class Tool < ApplicationRecord
  belongs_to :user
  has_many :tool_categories
  has_many :categories, through: :tool_categories
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  has_many :reviews
  validates :title, :description, :url, presence: true
  # validates :title, uniqueness: true
  validates :description, length: { minimum: 20 }

  include PgSearch::Model
  pg_search_scope :search_tools, against: [ :title, :description ],
    associated_against: {
      categories: :name
    },
    using: {
    tsearch: { prefix: true }
  }
end
