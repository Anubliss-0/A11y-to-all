class ToolCategory < ApplicationRecord
  belongs_to :category
  belongs_to :tool
  validates :category_id, :tool_id, presence: true
end
