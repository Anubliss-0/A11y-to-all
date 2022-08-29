class Tool < ApplicationRecord
  belongs_to user
  has_many bookmarks
  has_many resource_categories
  has_many reviews
  valiates :title, :descripation, :url, :user_id, presence: true
end
