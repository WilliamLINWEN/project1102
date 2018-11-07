class BroadCastMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
  	room = message.chatroom
  	ActionCable.server.broadcast("chat_#{room.id}",
  		message: message.content,
  		message_created_at: message.created_at.strftime('%Y/%m/%d %H:%M:%S'),
  		userID: message.user_id.to_s)
  	if message.user != room.master
	  	WebNotificationChannel.broadcast_to(
	  		room.master,
	  		message: "#{room.title} got a new message",
	  		roomID: (room.id).to_s
	  		)
	  end
  end
end
