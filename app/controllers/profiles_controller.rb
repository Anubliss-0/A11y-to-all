class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    authorize @profile
    @lists = List.select { |list| list.user_id == @profile.user_id }
    @tools = Tool.select { |tool| tool.user_id == @profile.user_id }
  end
end
