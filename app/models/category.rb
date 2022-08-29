class Category < ApplicationRecord
  has_many resource_categories
  has_many user_categories
end
