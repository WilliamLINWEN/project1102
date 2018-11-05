class Chatroom < ApplicationRecord
  has_many		:messages
  has_many 		:participants
  has_many		:users, through: :participants

  after_create_commit { self.update(master_id: self.users.last.id) }

  def last_message
  	messages.last
  end
end
