class UpdateOwnerScoreJob < ApplicationJob
  queue_as :default

  def perform(owner)
    @profile = owner.profile
    @profile.score = 0
    @tools = Tool.select { |tool| tool.user_id == owner.id }
    base = 0
    @tools.each do |tool|
      base += tool.rating
    end
    UpdateScoreJob.perform_now(owner)
    @profile.score += base
    @profile.save
  end
end
