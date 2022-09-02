class List < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :tools, through: :bookmarks
  # validates :title, uniqueness: true
end
