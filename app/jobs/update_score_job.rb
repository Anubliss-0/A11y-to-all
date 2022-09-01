class UpdateScoreJob < ApplicationJob
  queue_as :default

  def perform
    @profile = current_user.profile
    @lists = List.select { |list| list.user_id == current_user }.count
    raise
    @profile.score = 10 * @lists
    @profile.save!
  end
end
