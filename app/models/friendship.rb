class Friendship < ApplicationRecord
  belongs_to :friend1, foreign_key: :friend1_id, class_name: "Profile"
  belongs_to :friend2, foreign_key: :friend2_id, class_name: "Profile"
end
