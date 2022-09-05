class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom)
  end

  def new
    @chatroom = Chatroom.new
    authorize @chatroom
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    authorize @chatroom
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    @message = Message.new
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
