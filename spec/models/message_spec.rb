require 'rails_helper'

RSpec.describe Message, type: :model do
	it 'should has content' do
		@message = create(:message)
		expect(@message.content).to_not be_nil
	end
end