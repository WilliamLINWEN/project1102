class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  after_create_commit { BroadCastMessageJob.perform_later self }
end
