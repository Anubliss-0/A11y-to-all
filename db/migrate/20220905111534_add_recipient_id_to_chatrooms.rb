class AddRecipientIdToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :recipient_id, :integer
    add_column :chatrooms, :sender_id, :integer
  end
end
