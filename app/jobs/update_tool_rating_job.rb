class UpdateToolRatingJob < ApplicationJob
  queue_as :default

  def perform(tool, current_user)
    reviews = Review.select { |review| review.user_id == current_user.id}
    rating = 0
    reviews.each do |review|
      rating += review.rating
    end
    tool.rating = rating
    tool.save
  end
end
