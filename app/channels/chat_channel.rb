class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
  	Chatroom.find(data['roomID']).messages.create(content: data['message'], user_id: current_user.id)
  end
end
