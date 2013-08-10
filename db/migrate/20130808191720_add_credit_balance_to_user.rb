class AddCreditBalanceToUser < ActiveRecord::Migration
  def change
  	add_column :users, :credit_balance, :integer, default: 0
  end
end
