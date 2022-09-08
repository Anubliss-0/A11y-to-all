class UpdateScoreJob < ApplicationJob
  queue_as :default

  def perform(current_user)
    @profile = current_user.profile
    @lists = List.select { |list| list.user_id == current_user.id }.count
    @tools = Tool.select { |tool| tool.user_id == current_user.id }
    @reviews = Review.select { |review| review.user_id == current_user.id }.count
    @ratings = 0
    @tools.each do |tool|
      reviews = Review.select { |review| review.tool_id == tool.id }
      reviews.each do |review|
        @ratings += review.rating
      end
    end
    @profile.score = (10 * @lists) + (15 * @tools.count) + (5 * @reviews) + @ratings + 50
    @profile.save!
  end
end
