class Profile < ApplicationRecord
  belongs_to :user
  has_many :user_categories
  has_many :categories, through: :user_categories
  validates :name, :user_name, presence: true
  # validates :user_name, uniqueness: true
end
