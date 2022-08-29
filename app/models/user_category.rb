class UserCategory < ApplicationRecord
  belongs_to :profile
  belongs_to :category
  validates :profile_id, presence: true
  validates :category_id, presence: true
end
