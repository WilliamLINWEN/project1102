class ChatroomsController < ApplicationController
  def show
  	@room = Chatroom.find(params[:id])
  	@messages = @room.messages
  end
end
