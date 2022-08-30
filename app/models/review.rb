class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tool
  validates :rating, :content, presence: true
end
