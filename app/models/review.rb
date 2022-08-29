class Review < ApplicationRecord
  belongs_to profile
  belongs_to tool
  belongs_to review
  validate :profile_id, :resource_id, :text, :rating, presence: true
end
