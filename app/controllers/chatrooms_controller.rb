class ChatroomsController < ApplicationController
  def new
    @chatroom = Chatroom.new
    authorize @chatroom
  end

  def create
    @chatroom = Chatroom.new
    authorize @chatroom
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
    @message = Message.new
  end
end
