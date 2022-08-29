class ResourceCategory < ApplicationRecord
  belongs_to category
  belongs_to tool
  validates :category_id, presence: true
  validates :tool_id, presence: true
end
