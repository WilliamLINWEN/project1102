class AddCoverImageToChatrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :chatrooms, :cover_image, :string
  end
end
