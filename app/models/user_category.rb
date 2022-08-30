class UserCategory < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :user_id, :category_id, presence: true
end
