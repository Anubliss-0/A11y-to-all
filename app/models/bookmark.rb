class Bookmark < ApplicationRecord
  belongs_to list
  belongs_to tool
end
