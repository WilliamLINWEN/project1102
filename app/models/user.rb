class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participants
  has_many :chatrooms, through: :participants
  has_many :messages

  def recently_attended_rooms
  	chatrooms.where(id: messages.order(created_at: :desc).limit(5).collect(&:chatroom_id))
  end
end
