class List < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :tools, through: :bookmarks
  validates :title, uniquness: true
  validates :description, length: { minimum: 20 }
end
