class BroadCastMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
  	ActionCable.server.broadcast("chat_#{message.chatroom.id}",
  		message: message.content,
  		message_created_at: message.created_at.strftime('%Y/%m/%d %H:%M:%S'),
  		userID: message.user_id.to_s)
  end
end
