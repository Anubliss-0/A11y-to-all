class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    authorize @message
    @message.chatroom = @chatroom
    @message.user = current_user
    if @chatroom.sender_id == current_user.id
      @message.recipient_id = @chatroom.recipient_id
    elsif @chatroom.recipient_id == current_user.id
      @message.recipient_id = @chatroom.sender_id
    end
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        {
          message: render_to_string(partial: "message", locals: {message: @message}),
          sender_id: current_user.id
        }
      )
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
