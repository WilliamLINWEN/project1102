class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  after_create_commit :broadcast_message
  after_create_commit :create_participant_record

  private

  def broadcast_message
  	BroadCastMessageJob.perform_later self
  end

  def create_participant_record
  	return if user.chatrooms.include?(chatroom)
  	user.participants.create(chatroom_id: self.chatroom.id)
  end
end
