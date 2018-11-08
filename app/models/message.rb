# == Schema Information
#
# Table name: messages
#
#  id          :bigint(8)        not null, primary key
#  user_id     :bigint(8)
#  chatroom_id :bigint(8)
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

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
