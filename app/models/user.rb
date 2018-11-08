# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar                 :string
#  number                 :string
#  slug                   :text
#

class User < ApplicationRecord
  include NumberGenerator
  extend FriendlyId
  friendly_id :number, use: [:slugged, :finders]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participants
  has_many :chatrooms, through: :participants
  has_many :messages

  after_create_commit :assign_avatar

  def generate_number(options = {})
    options[:prefix] ||= 'u'
    options[:length] ||= 14
    super(options)
  end

  def recently_attended_rooms
  	chatrooms.where(id: messages.order(created_at: :desc).limit(5).collect(&:chatroom_id))
  end

  def appear_on(room_number)
    begin
      room = Chatroom.find(room_number)
      participant = participants.where(chatroom_id: room.id)
      return if participant.blank?
      participant.last.update(appearance: true)
    rescue => e
    end
  end

  def assign_avatar
    samples = ['identicon', 'monsterid', 'wavatar', 'retro', 'robohash']
    begin
      image_url = 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=' + samples[Random.new.rand(samples.length - 1)]
    rescue => e
      image_url = 'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp'
    end

    self.update(avatar: image_url)
  end
end
