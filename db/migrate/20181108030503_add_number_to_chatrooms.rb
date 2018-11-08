class AddNumberToChatrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :chatrooms, :number, :string
  end
end
