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

require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
