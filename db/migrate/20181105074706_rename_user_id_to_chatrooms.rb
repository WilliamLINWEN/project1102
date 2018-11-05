class RenameUserIdToChatrooms < ActiveRecord::Migration[5.2]
  def change
  	rename_column :chatrooms, :user_id, :master_id
  end
end
