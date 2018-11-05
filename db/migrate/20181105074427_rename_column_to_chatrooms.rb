class RenameColumnToChatrooms < ActiveRecord::Migration[5.2]
  def change
  	remove_foreign_key :chatrooms, :users
  end
end
