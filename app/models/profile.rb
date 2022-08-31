class Profile < ApplicationRecord
  belongs_to :user
  validates :name, :user_name, presence: true
  has_one_attached :photo
  # validates :user_name, uniqueness: true
end
