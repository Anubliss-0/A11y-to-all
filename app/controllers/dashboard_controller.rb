class DashboardController < ApplicationController
  skip_after_action :verify_authorized

  def reccomend
    @tools = Tool.all
    @categories = current_user.profile.categories
    @tool_categories = @categories & current_user.profile.categories

    @suggestions = @tool_categories.map do |category|
      category.tools
    end.flatten.sample(3)
  end
end
