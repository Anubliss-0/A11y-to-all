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
    @chatroom.sender_id = current_user.id
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    user = current_user
    @message = Message.new
    @messages = Message.select {|message| message.chatroom_id == @chatroom.id}
    @messages.each do |message|
      if message.user_id != user.id
        message.read = true
        message.save
      end
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :recipient_id)
  end
end
