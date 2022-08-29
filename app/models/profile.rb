class Profile < ApplicationRecord
  has_many :user_categories
  has_many :tools
  has_many :reviews
  has_many :lists
  validates :user_name, uniqueness: true
end
