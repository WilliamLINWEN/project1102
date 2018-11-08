# == Schema Information
#
# Table name: participants
#
#  id          :bigint(8)        not null, primary key
#  user_id     :bigint(8)
#  chatroom_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  appearance  :boolean          default(FALSE)
#

class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  after_update :broadcast_user_appear, if: Proc.new { |p| p.appearance }
  after_update :broadcast_user_disappear, if: Proc.new { |p| !p.appearance }

  private

  def broadcast_user_appear(appear: true)
  	BroadcasrUserAppearJob.perform_later(self.chatroom, appear)
  end

  def broadcast_user_disappear(appear: false)
  	BroadcasrUserAppearJob.perform_later(self.chatroom, appear)
  end
end
