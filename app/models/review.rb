class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tool
  validates :rating, :content, presence: true
  validates :rating, comparison: { greater_than: 0, less_than_or_equal_to: 5 }
end
