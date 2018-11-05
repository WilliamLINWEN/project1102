class ChatroomsController < ApplicationController
  def show
  	@room = Chatroom.find(params[:id])
  	@messages = @room.messages
  end

  def new
  	@room = Chatroom.new
  end

  def create
  	begin
  		room = current_user.chatrooms.new(chatroom_params)
  		if room.save
  			redirect_to root_path, notice: 'Success'
  		else
  			redirect_to root_path
  		end
  	rescue => e
  		redirect_to root_path, notice: e
  	end
  end

  private

  def chatroom_params
  	params.require(:chatroom).permit(:title)
  end
end
