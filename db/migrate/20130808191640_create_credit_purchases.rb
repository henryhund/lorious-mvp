class CreateCreditPurchases < ActiveRecord::Migration
  def change
    create_table :credit_purchases do |t|
    	t.belongs_to :user
    	t.integer :number_of_credits
    	t.integer :dollar_amount
    	t.string :stripe_id
    	t.integer :stripe_fee
      t.timestamps
    end
  end
end
