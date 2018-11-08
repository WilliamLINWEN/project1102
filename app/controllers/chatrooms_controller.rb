class ChatroomsController < ApplicationController
  def show
    @room = Chatroom.friendly.find(params[:id])
    current_user.chatrooms << @room
    @messages = @room.messages.order(created_at: :desc).limit(20).reverse
  end

  def new
    @room = Chatroom.new
    render layout: false
  end

  def create
    begin
      if current_user.chatrooms.create(chatroom_params)
        redirect_to root_path, notice: 'Success'
      else
        redirect_to root_path, notice: 'Fail'
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
