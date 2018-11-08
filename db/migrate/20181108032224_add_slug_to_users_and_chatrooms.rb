class AddSlugToUsersAndChatrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :slug, :text
    add_column :chatrooms, :slug, :text
  end
end
