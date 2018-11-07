class Chatroom < ApplicationRecord
  has_many		:messages
  has_many 		:participants
  has_many		:users, through: :participants

  after_create_commit :assign_master_id

  def last_message
  	messages.last
  end

  def master
  	User.find(master_id)
  end

  private

  def assign_master_id
    self.update(master_id: self.users.last.id)
  end
end
