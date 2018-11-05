class BroadCastMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
  	ActionCable.server.broadcast "chat_#{message.chatroom.id}", message: message.content
  end
end
