class ProfileCategory < ApplicationRecord
  belongs_to :profile
  belongs_to :category
  validates :profile_id, :category_id, presence: true
end
