class UpdateToolRatingJob < ApplicationJob
  queue_as :default

  def perform(tool, current_user)
    reviews = Review.select { |review| review.tool_id == tool.id}
    rating = 0
    tool.rating = 0
    reviews.each do |review|
      rating += review.rating
    end
    unless rating == 0
      rating /= reviews.count
    end
    tool.rating = rating
    tool.save
  end
end
