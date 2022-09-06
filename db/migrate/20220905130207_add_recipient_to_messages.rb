class AddRecipientToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :recipient_id, :integer
    add_column :messages, :sender_id, :integer
  end
end
