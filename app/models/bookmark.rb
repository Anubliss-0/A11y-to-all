class Bookmark < ApplicationRecord
  belongs_to :tool
  belongs_to :list
end
