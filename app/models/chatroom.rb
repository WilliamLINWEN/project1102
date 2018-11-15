# == Schema Information
#
# Table name: chatrooms
#
#  id          :bigint(8)        not null, primary key
#  master_id   :bigint(8)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  number      :string
#  slug        :text
#  cover_image :string
#

class Chatroom < ApplicationRecord
  include NumberGenerator
  extend FriendlyId
  friendly_id :number, use: [:slugged, :finders]

  has_many		:messages
  has_many 		:participants
  has_many		:users, through: :participants

  belongs_to  :category

  after_create_commit :assign_master_id
  after_create_commit { RoomJob.perform_later(self) }

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
