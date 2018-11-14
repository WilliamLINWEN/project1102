class AddCategroyReferenceToChatroom < ActiveRecord::Migration[5.2]
  def change
    add_reference :chatrooms, :category, foreign_key: true
  end
end
