class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :sender, foreign_key: :sender_id, class_name: "User"
  belongs_to :recipient, foreign_key: :recipient_id, class_name: "User"
  # validates :sender_id, uniqueness: { scope: :recipient_id }
end
