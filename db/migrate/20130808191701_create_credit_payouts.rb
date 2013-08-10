class CreateCreditPayouts < ActiveRecord::Migration
  def change
    create_table :credit_payouts do |t|
    	t.belongs_to :user
    	t.integer :number_of_credits
    	t.integer :dollar_amount
      t.timestamps
    end
  end
end
