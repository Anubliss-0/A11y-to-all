class ToolsController < ApplicationController
  before_action :set_tool, only: %i[show edit update destroy]

  def index
    @tools = policy_scope(Tool).all
  end

  def show
    authorize @tool
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

    if @tool.save
      redirect_to tool_path(@tool)
    else
      render :new
    end
  end

  def update
    authorize @tool
    if @tool.update(tool_params)
      redirect_to tool_path(@tool)
    else
      render :new
    end
  end

  def destroy
    authorize @tool
    @tool.destroy
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
