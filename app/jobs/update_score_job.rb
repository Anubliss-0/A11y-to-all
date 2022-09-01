class UpdateScoreJob < ApplicationJob
  queue_as :default

  def perform(current_user)
    @profile = current_user.profile
    @lists = List.select { |list| list.user_id == current_user.id }.count
    @tools = Tool.select { |tool| tool.user_id == current_user.id }.count
    @reviews = Review.select { |review| review.user_id == current_user.id }.count
    @profile.score = (10 * @lists) + (15 * @tools) + (5 * @reviews) + 50
    @profile.save!
  end
end
