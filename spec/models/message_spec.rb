# == Schema Information
#
# Table name: messages
#
#  id          :bigint(8)        not null, primary key
#  user_id     :bigint(8)
#  chatroom_id :bigint(8)
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Message, type: :model do
	it 'should has content' do
		@message = create(:message)
		expect(@message.content).to_not be_nil
	end
end
