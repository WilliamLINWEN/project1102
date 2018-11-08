class BroadCastMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    room = message.chatroom
    ActionCable.server.broadcast("chat_#{room.number}",
                                 message: message.content,
                                 message_created_at: message.created_at.strftime('%Y/%m/%d %H:%M:%S'),
                                 userNumber: message.user.number,
                                 avatar: message.user.avatar)
    if message.user != room.master
      WebNotificationChannel.broadcast_to(
        room.master,
        message: "#{room.title} got a new message",
        roomNumber: room.number
      )
    end
  end
end
