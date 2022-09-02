class DashboardController < ApplicationController
  skip_after_action :verify_authorized

  def reccomend
    @tools = Tool.all
    @categories = current_user.profile.categories
    # raise
    @tool_category = ToolCategory.select { |category| category.category_id == @categories.id }
    @suggestions = @tools.select { |tool| tool.id == @tool_category.tool_id }
  end
end
