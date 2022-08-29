class UserCategory < ApplicationRecord
  belongs_to profile
  belongs_to category
end
