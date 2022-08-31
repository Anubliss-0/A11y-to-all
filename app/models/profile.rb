class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_categories
  has_many :categories, through: :profile_categories
  belongs_to :user, dependent: :destroy
  validates :name, :user_name, presence: true
  has_one_attached :photo
  # validates :user_name, uniqueness: true
end
