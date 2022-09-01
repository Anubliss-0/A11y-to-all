class ToolsController < ApplicationController
  before_action :set_tool, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @tools = policy_scope(Tool.search_tools(params[:query]))
    else
      @tools = policy_scope(Tool)
    end
  end

  def show
    authorize @tool
    @reviews = @tool.reviews
  end

  def new
    @tool = Tool.new
    authorize @tool
  end

  def edit
    authorize @tool
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    authorize @tool
    @tool.rating = 0
    if @tool.save
      UpdateScoreJob.perform_now(current_user)
      redirect_to tool_path(@tool)
    else
      render :new
    end
  end

  def update
    authorize @tool
    if @tool.update(tool_params)
      flash[:notice] = "#{@tool.title} has been updated"
      redirect_to tool_path(@tool)
    else
      render :new
    end
  end

  def destroy
    authorize @tool
    @tool.destroy
    flash[:notice] = "#{@tool.title} has been deleted"
    redirect_to tools_path
  end


  private

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:title, :description, :url, :rating)
  end
end
