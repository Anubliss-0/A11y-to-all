class Profile < ApplicationRecord
  belongs_to :user
  validates :name, :user_name, presence: true
  # validates :user_name, uniqueness: true
end
