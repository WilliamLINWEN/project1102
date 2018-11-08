class Chatroom < ApplicationRecord
  include NumberGenerator
  extend FriendlyId
  friendly_id :number, use: [:slugged, :finders]

  has_many		:messages
  has_many 		:participants
  has_many		:users, through: :participants

  after_create_commit :assign_master_id

  def generate_number(options = {})
    options[:prefix] ||= 'r'
    options[:length] ||= 14
    super(options)
  end

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
