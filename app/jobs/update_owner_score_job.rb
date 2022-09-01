class UpdateOwnerScoreJob < ApplicationJob
  queue_as :default

  def perform(owner)
    @profile = current_user.profile
    @profile.score = 0
    @tools = Tool.select { |tool| tool.user_id = current_user.id }
    base = 0
    @tools.each do |tool|
      base += tool.rating
    end
    UpdateScoreJob.perform(owner)
    profile.score += base
  end
end
