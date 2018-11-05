class ChangeColumnToChatrooms < ActiveRecord::Migration[5.2]
  def change
  	remove_index "chatrooms", name: "index_chatrooms_on_user_id"
  end
end
