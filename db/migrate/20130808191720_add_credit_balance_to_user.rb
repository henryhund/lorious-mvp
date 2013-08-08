class AddCreditBalanceToUser < ActiveRecord::Migration
  def change
  	add_column :users, :credit_balance, :integer
  end
end
