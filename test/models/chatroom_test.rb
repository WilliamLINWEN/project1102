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

require 'test_helper'

class ChatroomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
