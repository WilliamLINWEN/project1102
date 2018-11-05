class BroadCastMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
  	ActionCable.server.broadcast "chat_#{message.chatroom.id}", message: message.content, message_created_at: message.created_at, userID: message.user_id.to_s
  end
end
