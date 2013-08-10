class AddRecipientInformationToUser < ActiveRecord::Migration
  def change
    remove_column :users, :last_4_digits
    add_column :users, :card_last_4_digits, :string, length: 4
    add_column :users, :bank_last_4_digits, :string, length: 4
    add_column :users, :stripe_recipient_id, :string
    add_column :users, :bank_name, :string
  end
end
