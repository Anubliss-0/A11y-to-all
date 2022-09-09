class Profile < ApplicationRecord
  belongs_to :user
  has_many :profile_categories
  has_many :categories, through: :profile_categories
  belongs_to :user, dependent: :destroy
  validates :name, :user_name, presence: true
  has_one_attached :photo
  has_many :friendships
  # validates :user_name, uniqueness: true

  #search user profiles, need to add search bar and javascript
  include PgSearch::Model
  pg_search_scope :search_profiles,
  against: [ :name, :bio, :location, :user_name ],
  using: {
    tsearch: { prefix: true }
  }
end
