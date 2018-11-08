class AddAppearanceToParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :appearance, :boolean, default: false
  end
end
