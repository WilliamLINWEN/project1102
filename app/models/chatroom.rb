# == Schema Information
#
# Table name: chatrooms
#
#  id         :bigint(8)        not null, primary key
#  master_id  :bigint(8)
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  number     :string
#  slug       :text
#
# todo: coverimage https://picsum.photos/200/300/?random

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
