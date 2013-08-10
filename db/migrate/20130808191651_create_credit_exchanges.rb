class CreateCreditExchanges < ActiveRecord::Migration
  def change
    create_table :credit_exchanges do |t|
    	t.integer :giver
    	t.integer :receiver
    	t.integer :number_of_credits
      t.timestamps
    end

    add_index :credit_exchanges, :giver
    add_index :credit_exchanges, :receiver
  end
end
