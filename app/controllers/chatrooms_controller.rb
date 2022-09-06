class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom)
  end

  def new
    @chatroom = Chatroom.new
    authorize @chatroom
    @profiles = Profile.all
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    authorize @chatroom
    @chatroom.sender_id = current_user.id
    profile = Profile.find_by_user_name(params[:chatroom][:recipient_id])
    user = User.find(profile.user_id)
    @chatroom.recipient_id = user.id
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
    @messages = Message.select { |message| message.chatroom_id == @chatroom.id }
    @messages.each do |message|
      if message.user_id != user.id
        message.read = true
        message.save
      end
    end
  end

  def chat_with_user
    @profile = Profile.find(params[:id])
    @chatroom = Chatroom.create(name: "Chat with #{@profile.user_name}", recipient_id: @profile.user.id, sender_id: current_user.id)
    authorize @chatroom
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :recipient_id)
  end
end
