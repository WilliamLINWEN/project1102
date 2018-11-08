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

require 'rails_helper'

RSpec.describe Chatroom, type: :model do

	before(:all) do
		@room1 = create(:chatroom)
		@user = create(:user)
		@user.chatrooms << @room1
	end

  it "should has title" do
    expect(@room1.title).to_not be_nil
  end

  it "should has at least one user" do
  	@room1.send(:assign_master_id)
  	expect(@room1.users.count).to be >= 1
  	expect(@room1.master).to eq @user
  end
end
