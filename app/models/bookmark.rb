class Bookmark < ApplicationRecord
  belongs_to :tool
  belongs_to :list
  validates :tool_id, :list_id, presence: true
end
