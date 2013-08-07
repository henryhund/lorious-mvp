class AddStripeFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :last_4_digits, :string, limit: 4
  	add_column :users, :card_type, :string
  end
end
